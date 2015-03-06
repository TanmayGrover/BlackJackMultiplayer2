
    //
//  Player.swift
//  BlackJackUltimate
//
//  Created by Tanmay Grover on 3/4/15.
//  Copyright (c) 2015 Tanmay Grover. All rights reserved.
//

import Foundation

class Player {
    
    var name:String
    var money:Int = 100
    var hand : Hand
    
    init(name:String, money : Int) {
        self.name = name
        self.money = money
        hand = Hand()
        
    }
    
    func setUpHand (){
        //var d = Deck()
        println("inside setuphand")
        hand.cards.append(Singelton.sharedInstance.sdeck.removeAtIndex(0))
        hand.cards.append(Singelton.sharedInstance.sdeck.removeAtIndex(0))
    }
    
    func getCardForHit(){
        hand.cards.append(Singelton.sharedInstance.sdeck.removeAtIndex(0))
    }
    
}