//
//  checkinViewController.swift
//  BreaktheBubble
//
//  Created by Huiyi Victoria Lyu on 4/21/20.
//  Copyright © 2020 Huiyi Victoria Lyu. All rights reserved.
//

import UIKit

class checkinViewController: UIViewController {
    @IBOutlet weak var GIF: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GIF.loadGif(name: "final")
        
        
        
        alert()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func alert() {
        let message = UIAlertController(title: "Your Four Digit Check-In code is 2457 ", message: "Please Type in the Code and Your Eagle-ID", preferredStyle: .alert)
        self.present(message,animated: true,completion: nil)
    }
    
    
    
    @IBAction func subMit(_ sender: Any) {
        
        let alert = UIAlertController(title: "Submit the Check-In Information to Club Administration", message: "Please Make Sure All Information is Correct", preferredStyle: .alert)
        let subButton = UIAlertAction(title: "Submit", style: .default, handler:nil)
        let cancelButton = UIAlertAction(title:"Cancel",style: .cancel,handler:nil)
        alert.addAction(subButton)
        alert.addAction(cancelButton)
        self.present(alert,animated: true,completion: nil)
    }
    
}
