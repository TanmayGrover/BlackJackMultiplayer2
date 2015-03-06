//
//  Deck.swift
//  BlackJackUltimate
//
//  Created by Tanmay Grover on 3/4/15.
//  Copyright (c) 2015 Tanmay Grover. All rights reserved.
//

//
//  Dealer.swift
//  BlackJack
//
//  Created by Tanmay Grover on 2/17/15.
//  Copyright (c) 2015 Tanmay Grover. All rights reserved.
//

import Foundation


class Deck{
    var deck = [Int]()
    
    var deckCount = 3
    //returns dealer card
    func dealCard ( c : Int) {
        for i in 1...c{
            for index in 0...3{
                for item in 1...13{
                    //Putting deck with card values .
                    if item > 10 {
                        deck.append(10)
                    }else{
                        deck.append(item)
                        
                    }
                }
            }
        }
        shuffle()
        Singelton.sharedInstance.sdeck=deck
        println(deck[9])
    }
    //Help from google
    func shuffle() {
        var temp: Int
        for i in 0...(deck.count-1) {
            let j = Int(arc4random_uniform(UnicodeScalarValue(deck.count)))
            temp = deck[i]
            println(i,j)
            deck[i]=deck[j]
            deck[j]=temp
            
        }
    }
    //returns first card for player
    func getCard1Player()-> (Int) {
        
        var j :Int
        
        j = 9
        
        //j =  Int(arc4random_uniform(UInt32(deck.count-1)) + 1)
        println("inside get card")
        println("J is "+"\(j)")
        var card  = deck[j]
        println(" card is \(card)")
        
        //deck.removeAtIndex(j)
        return (card)
        
        
    }
    //returns second card for player
    func getCard2Player()-> Int{
        var k:Int
        k =  Int(arc4random_uniform((deck.count-1)+1))
        var card2 = deck[k]
        //println("Card2 is \(card2)" )
        deck.removeAtIndex(k)
        return (card2)
        
    }
    //returns another card for dealer
    func getDealerCard() -> Int{
        var l :Int
        
        
        l =  Int(arc4random_uniform(UInt32(deck.count-1)) + 1)
        //println(j)
        var card3  = deck[l]
        
        deck.removeAtIndex(l)
        return (card3)
        
    }
    //hit method
    func getHitCard () -> Int {
        var h :Int
        h =  Int(arc4random_uniform(UInt32(deck.count-1)) + 1)
        
        var cardHit = deck[h]
        
        deck.removeAtIndex(h)
        return cardHit
        
        
    }
    
    func getAnotherCard4Dealer () -> Int{
        var g :Int
        g =  Int(arc4random_uniform(UInt32(deck.count-1)) + 1)
        
        var newDealerCard = deck[g]
        deck.removeAtIndex(newDealerCard)
        return newDealerCard
        
    }
    
    
    
    
}