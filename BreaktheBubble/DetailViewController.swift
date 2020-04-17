//
//  DetailViewController.swift
//  BreaktheBubble
//
//  Created by Huiyi Victoria Lyu on 4/11/20.
//  Copyright © 2020 Huiyi Victoria Lyu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var DetailName: UILabel!
    var eventname:String!
    var eventDetail: String!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if eventDetail == nil {
            eventDetail =  " "
        }

        if eventname == nil {
        eventname = " "
            
        }
        
        eventName.text = eventname
        DetailName.text = eventDetail
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
