//
//  Dealer.swift
//  BlackJackUltimate
//
//  Created by Tanmay Grover on 3/5/15.
//  Copyright (c) 2015 Tanmay Grover. All rights reserved.
//

import Foundation

class Dealer {
    
    var hand : Hand
    
    init(){
     hand = Hand()
    }
    
    func setUpDealerHand(){
        
        hand.cards.append(Singelton.sharedInstance.sdeck.removeAtIndex(0))
        hand.cards.append(Singelton.sharedInstance.sdeck.removeAtIndex(0))
    }
    
    func setUpDealerAgainHand(){
        
        hand.cards.append(Singelton.sharedInstance.sdeck.removeAtIndex(0))
        
    }

        
}