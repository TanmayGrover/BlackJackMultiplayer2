//
//  Card.swift
//  BlackJackUltimate
//
//  Created by Tanmay Grover on 3/4/15.
//  Copyright (c) 2015 Tanmay Grover. All rights reserved.
//

import Foundation

class Card {
    
    var rank:Int
    var suite:String
    
    init(rank:Int, suite:String){
        self.rank = rank
        self.suite = suite
    }
    
}