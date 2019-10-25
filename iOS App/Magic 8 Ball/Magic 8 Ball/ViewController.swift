//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Slimn Srarena on 9/9/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballImages = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    var randomBallNumber:Int = 0
    

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newBallImage()
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        newBallImage()
    }

    @IBAction func askButtonPressed(_ sender: UIButton) {
        newBallImage()
    }
    
    func getBallNUmber() -> Int {
        return Int.random(in: 0...4)
    }
    
    func newBallImage() -> Void {
        randomBallNumber = getBallNUmber()
        imageView.image = UIImage(named:ballImages[randomBallNumber])
    }
}

