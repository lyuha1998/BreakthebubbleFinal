//
//  FirstPageViewController.swift
//  BreaktheBubble
//
//  Created by Huiyi Victoria Lyu on 4/11/20.
//  Copyright © 2020 Huiyi Victoria Lyu. All rights reserved.
//

import UIKit
import AVFoundation

class FirstPageViewController: UIViewController {
     
    var audioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(soundName: "sound", audioPlayer: &audioPlayer)
    
        // Do any additional setup after loading the view.
    }
    


    @IBAction func swipeUp(_ sender: Any) {
        
        performSegue(withIdentifier: "ShowPage", sender: nil)
        
    }
}
func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
    if let sound = NSDataAsset(name: soundName) {
        do {
            try audioPlayer = AVAudioPlayer(data: sound.data)
            audioPlayer.play()
        } catch {
            print("ERROR: Data from \(soundName) could not be played as an audio file")
        }
    } else {
        print("ERROR: Could not load data from file \(soundName)")
    }
}
