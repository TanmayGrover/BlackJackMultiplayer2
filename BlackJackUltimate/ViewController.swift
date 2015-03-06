//
//  ViewController.swift
//  BlackJackUltimate
//
//  Created by Tanmay Grover on 3/3/15.
//  Copyright (c) 2015 Tanmay Grover. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    //UI Labels//
    @IBOutlet weak var p1Cards: UILabel!
    
    @IBOutlet weak var p2Cards: UILabel!
    
    
    @IBOutlet weak var p3Cards: UILabel!
    
    @IBOutlet weak var player2Bet: UITextField!
    @IBOutlet weak var player1Bet: UITextField!
    
    @IBOutlet weak var p1Status: UILabel!
    
    
    @IBOutlet weak var p2Status: UILabel!
    
    @IBOutlet weak var dealerCards: UILabel!
    
    
    @IBOutlet weak var dealerStatus: UILabel!
    
    
    @IBOutlet weak var gameStatus: UILabel!
    
    
    @IBOutlet weak var roundCount: UILabel!
    
    //Initialisations and Declarations//
    var d = Deck()
    
    var noOfDecks : Int = 2
    
    var playerArray :[Player] = []
    
    var noOfPlayers :Int = 2
    
    var dealerObject = Dealer()
    
    var dealerFlip : Bool = false
    
    var value : Int = 0
    
    var round : Int = 1
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //Buttons
    
    @IBAction func Deal(sender: AnyObject) {
        
        d.dealCard(noOfDecks)
        
        for var index = 0; index < noOfPlayers; ++index {
            
            
            var p = Player(name: "P\(index)", money:100 )
            playerArray.append(p)
            
            println("insside method \(index)")
            
            
            playerArray[index].setUpHand()
            
            getLabel(index).text = playerArray[index].hand.getAllCards()
            
            
            
        }
        
        playerArray[0].hand.status = statusOfHand.turn
        
        dealerObject.setUpDealerHand()
        dealerCards.text = dealerObject.hand.getDealerCards(dealerFlip)
        
        
    }
    
    
    
    @IBAction func hitButton(sender: AnyObject) {
        
        
        for players in playerArray{
            //var value :Int = 0
            var hand = players.hand
            if players.hand.status == statusOfHand.turn {
                players.getCardForHit()
                getLabel(value).text = players.hand.getAllCards()
            
                if (players.hand.Blackjack()){
                    //getStatusLabel(value).text = "Won"
                    players.hand.status = statusOfHand.blackjack
                    value++
                    if (value < playerArray.count){
                        
                        playerArray[value].hand.status = statusOfHand.turn
                       break
                    }
                    
                }
                else if (players.hand.Busted()){
                    //getStatusLabel(value).text = "Lost"
                    players.hand.status = statusOfHand.busted
                    value++
                    if(value <  playerArray.count){
                        

                        playerArray[value].hand.status = statusOfHand.turn
                        break
                    }
                    
                    
                    
                }
                
            }
            println("i is  \(value)")
        }
        
    }
    
    
    @IBAction func standButton(sender: AnyObject) {
        
       
        
        if(value == playerArray.count){
            dealerFlip = true
            
            while(dealerObject.hand.score <= 16){
                dealerObject.setUpDealerAgainHand()
            }
            
            dealerCards.text = dealerObject.hand.getDealerCards(dealerFlip)

            
            calculateBet()
            
            
            
        }
        else{
            playerArray[value].hand.status = statusOfHand.stand
            value++
            if(value != playerArray.count){
            playerArray[value].hand.status = statusOfHand.turn
            }
        }
        
        
        
    }
    
    
    @IBAction func nextRound(sender: AnyObject) {
        
        clearEverything()
    }
    
    
    
    //Methods
    
    func getLabel(var i : Int) -> UILabel {
        switch i {
            
        case 0 : return p1Cards
            
        case 1 : return p2Cards
            
        case 2 : return p3Cards
            
        default :
            return p1Cards
            
        }
        
    }
    
    
    func getUITextField(var i : Int) -> UITextField {
        switch i {
            
        case 0 : return player1Bet
            
        case 1 : return player2Bet
            
            //case 2 : return p3Cards
            
        default :
            return player1Bet
            
        }
        
    }
    
    
    func calculateBet() {
        var i : Int = 0
        var j : Int = 0
        
        
        for players in playerArray{
            
            if(dealerObject.hand.score > 21 && players.hand.score <= 21) {
                players.hand.money = players.hand.money + getUITextField(i).text.toInt()!
            }
            
            else if (dealerObject.hand.score == 21 && dealerObject.hand.score > players.hand.score){
             
                players.hand.money = players.hand.money - getUITextField(i).text.toInt()!
                
            }
            
            else if (dealerObject.hand.score == players.hand.score) && (dealerObject.hand.score <= 21 && players.hand.score <= 21 ){
               gameStatus.text = "PUSH Status !"
            }
            
            else if (players.hand.status == statusOfHand.blackjack){
                players.hand.money = players.hand.money + getUITextField(i).text.toInt()!
            }
            else if ( players.hand.status == statusOfHand.busted){
                players.hand.money = players.hand.money - getUITextField(i).text.toInt()!
            }
            
            else if (players.hand.score < 21 && dealerObject.hand.score < 21 && players.hand.score > dealerObject.hand.score ){
                players.hand.money = players.hand.money + getUITextField(i).text.toInt()!
            }
            
            i++
            
        }
        
        var statusString : String = ""
        for p in playerArray{
            
            var playerStatus : String = "P\(j+1) has \(p.hand.money)"
            statusString = statusString + "  " + playerStatus
            j++
        }
        
        gameStatus.text = statusString
        
        roundCount.text = "Round \(round)"
        
    }
    
    func clearEverything(){
        var k : Int = 0
        round++
        for p in playerArray{
            
           
            getLabel(k).text = ""
            getUITextField(k).text = ""
            dealerCards.text = ""
            gameStatus.text = ""
            
            k++
        }
        
        
        if (round > 5){
            round = 0
            d.shuffle()
        }
        roundCount.text = "Round \(round)"
        
        

    }
}



