//
//  BIKEBCViewController.swift
//  BreaktheBubble
//
//  Created by Huiyi Victoria Lyu on 4/22/20.
//  Copyright © 2020 Huiyi Victoria Lyu. All rights reserved.
//

import UIKit
import SafariServices
import AVKit

class BIKEBCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func here(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSc5Sdu1cqsgWsCWxMRImLQBgFhIBx6t5ucKM0y2o-CVmsvapA/viewform")!)
               present(vc, animated: true)
    }
    @IBAction func pressed(_ sender: Any) {
              if let path = Bundle.main.path(forResource: "bikebc final", ofType: "mp4")
              {
                  let video = AVPlayer(url: URL(fileURLWithPath: path))
                  let videoPlayer = AVPlayerViewController()
                  videoPlayer.player = video
                  
            present(videoPlayer, animated: true, completion:
                  {
                      video.play()
                  })
              }
          }
    }

