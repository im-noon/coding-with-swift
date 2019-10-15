//
//  ViewController.swift
//  Dicee
//
//  Created by Slimn Srarena on 8/9/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    
    @IBOutlet var dice1ImageView: UIImageView!
    @IBOutlet var dice2ImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  
        updateDiceImages()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        updateDiceImages()
    }
    
    func updateDiceImages() -> Void {
        randomDiceIndex1 = Int.random(in: 0...5)
        randomDiceIndex2 = Int.random(in: 0...5)
        
        dice1ImageView.image = UIImage(named:diceImages[randomDiceIndex1])
        dice2ImageView.image = UIImage(named:diceImages[randomDiceIndex2])
    }

}

