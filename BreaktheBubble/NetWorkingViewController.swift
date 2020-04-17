//
//  NetWorkingViewController.swift
//  BreaktheBubble
//
//  Created by Huiyi Victoria Lyu on 4/11/20.
//  Copyright © 2020 Huiyi Victoria Lyu. All rights reserved.
//

import UIKit

class NetWorkingViewController: UIViewController {
    @IBOutlet weak var bigtableView: UITableView!
    var networkingEvents = ["Women in Business Gala","Student Business Consortium featuring Bachelor in Paradise", "Accounting Academy CPA Panel","Women in Innovations Discussion", "Techtrek Boston - Wayfair","Finance Academy Networking with Barclays Investment Banking","Bagels with Deloitte - Career Center","Lunch with an Entrepreneur featuring Bill Clerico from Wepay","Consulting 101 with McKinsey Co.", "PwC Service Spotlight - Career Center ","Women in Business and WIN featuring Oracle Info Panel","Women Diversity Luncheon with KPMG","Externship Panels with Accounting Academy","Lynch Students Teching Fellowship Sharing","MCAS Computer Science Society Job Shadow Info Panel","Nursing Graduate Schools Placements with Professionals" ]

    let networkingEventsPlace = ["Boston College Club in Financial District April 8th 8:00-9:00pm", "Devlin 008 April 9th 10:00-11:00AM","Fulton 110 April 9th 11:00-12:00AM", "Meet at Conte Forum Bus Stop April 12th 4:00-5:00PM","Devlin 008 April 9th 10:00-11:00AM","Devlin 008 April 9th 10:00-11:00AM", "Cushing 120 April 13th 10:00-11:00AM","Devlin 008 April 9th 10:00-11:00AM","Devlin 008 April 9th 10:00-11:00AM", "Cushing 120 April 25th 4:00-5:00PM","Fulton 110 April 9th 11:00-12:00AM","KPMG Boston Seaport Avenue", "April 20th 4:00-6:00PM","Devlin 008 April 9th 10:00-11:00AM","Fulton 110 April 9th 11:00-12:00AM","O'Connell House May 3rd 2:00-3:00PM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bigtableView.dataSource = self
        bigtableView.delegate = self
        // Do any additional setup after loading the view.
    }
    

  override func prepare(for segue: UIStoryboardSegue, sender:Any?)
       {
           if segue.identifier == "Click"
           {
               let destination = segue.destination as! DetailViewController
               let selectedIndexPath = bigtableView.indexPathForSelectedRow!
               destination.eventname = networkingEvents[selectedIndexPath.row]
            destination.eventDetail = networkingEventsPlace[selectedIndexPath.row]
            
               
           } else {
               if let selectedIndexPath = bigtableView.indexPathForSelectedRow {
                   bigtableView.deselectRow(at: selectedIndexPath, animated: true)
               }
           }
           
       }


}



extension NetWorkingViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return networkingEvents.count
        //return the number of sections
    }
    

    
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //to populate the cells
        cell.textLabel?.text = networkingEvents[indexPath.row]
        cell.detailTextLabel?.text = networkingEventsPlace[indexPath.row]
        print("dequeueing the table view cell for index path row")
        return cell
        
        
        // only thing need to change, different datasource and ccell might be identified differently
        
    }
    
    
}

