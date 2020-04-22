//
//  SelectionViewController.swift
//  BreaktheBubble
//
//  Created by Huiyi Victoria Lyu on 4/11/20.
//  Copyright © 2020 Huiyi Victoria Lyu. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func selectionTapped(_ sender: Any) {
        performSegue(withIdentifier: "Next", sender: nil)
    }
    

}
