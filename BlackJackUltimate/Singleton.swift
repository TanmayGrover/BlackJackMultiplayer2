//
//  Singleton.swift
//  BlackJackUltimate
//
//  Created by Tanmay Grover on 3/4/15.
//  Copyright (c) 2015 Tanmay Grover. All rights reserved.
//

import Foundation

class Singelton {
    
    var noOfPlayers:Int = 0
    
    var startingBalance:Double = 0
    
    var noOfDecks:Int = 0
    
    var sdeck  = [Int]()
    
    class var sharedInstance: Singelton {
        
        struct Static {
            static let instance: Singelton = Singelton()
        }
        return Static.instance
    }
    
}