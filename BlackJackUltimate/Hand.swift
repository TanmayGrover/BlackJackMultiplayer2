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
    
    var bet:Int = 1
    
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
        bet = 0
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
        
        if(cards.count > 1){
            for l in 1...cards.count{
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