//
//  ViewController.swift
//  BreaktheBubble
//
//  Created by Huiyi Victoria Lyu on 4/10/20.
//  Copyright © 2020 Huiyi Victoria Lyu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var trendingEvents: [String] = ["Agape Latte Sweet Talk","Women in Business Gala", "Asian Caucus First General Meeting", "Campus Activity Board Tailgate", "Modstock Concert", "ALC Ball 2020" ]
    var trendingEventsLocation =  ["Robsham Theater 10:00AM-11:00AM","Boston College Club in Financial District 4:00-8:00PM","Devlin 008 9:00PM-9:30PM","Conte Forum 5:00PM-6:00PM","Margot Recreational Center 5:00PM-6:00PM","Westin Copley Hotel 11:00PM-11:30PM"]
    var trendingEventsLatitude: [CLLocationDegrees] = [42.337518,42.355224,42.335397,42.335692,42.337507,42.348419]
    var trendingEventsLongtitude: [CLLocationDegrees] = [-71.168188,-71.055700,-71.169717,-71.167695,-71.164401,-71.077447]
    
    var yAtLanding: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        yAtLanding = imageView.frame.origin.y
         imageView.frame.origin.y = -imageView.frame.size.height
         UIView.animate(withDuration: 4, animations: {self.imageView.frame.origin.y = self.yAtLanding}, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?)
       {
           if segue.identifier == "Click"
           {
               let destination = segue.destination as! DetailViewController
               let selectedIndexPath = tableView.indexPathForSelectedRow!
               destination.eventname = trendingEvents[selectedIndexPath.row]
            destination.eventDetail = trendingEventsLocation[selectedIndexPath.row]
            destination.eventlatitude = trendingEventsLatitude[selectedIndexPath.row]
            destination.eventlongitude=trendingEventsLongtitude[selectedIndexPath.row]
            
               
           } else {
               if let selectedIndexPath = tableView.indexPathForSelectedRow {
                   tableView.deselectRow(at: selectedIndexPath, animated: true)
               }
           }
           
       }


    @IBAction func imageTapped(_ sender: Any) {
        performSegue(withIdentifier: "ShowOptions", sender: nil)
        
    }
}





extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingEvents.count
        //return the number of sections
    }
    

    
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //to populate the cells
        cell.textLabel?.text = trendingEvents[indexPath.row]
        cell.detailTextLabel?.text = trendingEventsLocation[indexPath.row]
        print("dequeueing the table view cell for index path row")
        return cell
        
        
        // only thing need to change, different datasource and ccell might be identified differently
        
    }
    
    
}

