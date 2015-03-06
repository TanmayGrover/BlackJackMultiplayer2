//
//  Hand.swift
//  BlackJackUltimate
//
//  Created by Tanmay Grover on 3/4/15.
//  Copyright (c) 2015 Tanmay Grover. All rights reserved.
//

import Foundation

class Hand {
    
    var cards: [Int]
    
    var money:Int
    
    var dFlip : Bool = false
    
    var status : statusOfHand
    
    var score:Int {
        get{
            var sum = 0
            for card in cards {
                sum += card
            }
            return sum
        }
    }
    
    init(){
        money = 100
        cards = []
        //status = "none"
        status = statusOfHand.stand
    }
    
    func Blackjack() -> Bool{
        if(score == 21){
            return true
        }
        else{
            return false
        }
        
    }
    
    func Busted() -> Bool {
        if (score > 21){
            return true
        }
        else{
            return false
        }
        
    }
    
    func getAllCards() -> String {
        
        var cardString = " "
        cardString = String(cards[0])

        if(cards.count > 1){
            for l in 2...cards.count{
                if(cards[l-1] == 1 ){
                    
                    //Choosing via taking user choice from console
                    // Referened from Google
                    println("Do you want to choose Ace as 1 ?")
                    var fh = NSFileHandle.fileHandleWithStandardInput()
                    
                }
                
                cardString = cardString + " , " + String(cards[l-1])
            }
        }
        return cardString
    }
    
    func getDealerCards(var dflip : Bool) -> String{
        
        var dealerCard : String = " "
        
        
            if(!dflip){
                dealerCard = "FLIP"
            }
            else
            {
                dealerCard = String(cards[0])
        }
            
            for k in 2...cards.count{
                
                
                  dealerCard = dealerCard + "," + String(cards[k-1])

                }
                
            
        
        return dealerCard
        
    }
    
    
    
    
    
    
}