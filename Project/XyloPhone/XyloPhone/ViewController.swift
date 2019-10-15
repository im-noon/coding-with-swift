//
//  ViewController.swift
//  XyloPhone
//
//  Created by Slimn Srarena on 12/9/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer:AVAudioPlayer?
    
    let soundFiles = ["note1",
                      "note2",
                      "note3",
                      "note4",
                      "note5",
                      "note6",
                      "note7"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func playSound(_ index:Int) -> Void {
        if (index >= 0) && (index < soundFiles.count) {
            do {
                let fileName = soundFiles[index]
                let path = Bundle.main.path(forResource:fileName, ofType:"wav")!
                let url = URL(fileURLWithPath: path)
                audioPlayer = try AVAudioPlayer(contentsOf:url)
            }
            catch {
                print("error: @\(#function) line@\(#line) \(error.localizedDescription)")
            }
            audioPlayer?.play()
        }
    }

    @IBAction func notePressed(_ sender: UIButton) {
        playSound(sender.tag)
    }
}

