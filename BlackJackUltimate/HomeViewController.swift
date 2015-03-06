//
//  HomeViewController.swift
//  BlackJackUltimate
//
//  Created by Tanmay Grover on 3/6/15.
//  Copyright (c) 2015 Tanmay Grover. All rights reserved.
//

import Foundation

import UIKit


class HomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var noofPlayers: UITextField!
    
    @IBOutlet weak var noOfDecks: UITextField!
    
    override func  prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as ViewController
        controller.noOfDecks = noOfDecks.text.toInt()!
        controller.noOfPlayers = noofPlayers.text.toInt()!
        
        
    }
    
}
