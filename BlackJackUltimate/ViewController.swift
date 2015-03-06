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
    
    @IBOutlet weak var plaer2Text: UITextField!
    @IBOutlet weak var player1Bet: UITextField!
    
    @IBOutlet weak var p1Status: UILabel!
    
    
    @IBOutlet weak var p2Status: UILabel!
    
    @IBOutlet weak var dealerCards: UILabel!
    
    
    
    //Initialisations and Declarations//
    var d = Deck()
    
    var noOfDecks : Int = 2
    
    var playerArray :[Player] = []
    
    var noOfPlayers :Int = 2
    
    var dealerObject = Dealer()
    
    var dealerFlip : Bool = false
    
    var value : Int = 0
    
    
    
    
    
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
                   getStatusLabel(value).text = "Won"
                   players.hand.status = statusOfHand.blackjack
                   value++
                    if (value < playerArray.count){
                   playerArray[value].hand.status = statusOfHand.turn
                    }
                   break
                }
                else if (players.hand.Busted()){
                    getStatusLabel(value).text = "Lost"
                    players.hand.status = statusOfHand.busted
                    value++
                    if(value <  playerArray.count){
                    playerArray[value].hand.status = statusOfHand.turn
                    }
                    break
                    
                    
                }
               
            }
            println("i is  \(value)")
        }
        
    }
    
    
    @IBAction func standButton(sender: AnyObject) {
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
    
    func getStatusLabel(var i : Int) -> UILabel {
        switch i {
            
        case 0 : return p1Status
            
        case 1 : return p2Status
            
        //case 2 : return p3Cards
            
        default :
            return p1Status
            
        }
        
    }
}



