//
//  DetailViewController.swift
//  BreaktheBubble
//
//  Created by Huiyi Victoria Lyu on 4/11/20.
//  Copyright © 2020 Huiyi Victoria Lyu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import SafariServices

final class LocationAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D,title: String?,subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
    }
}
class DetailViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var DetailName: UILabel!
    var eventname:String!
    var eventDetail: String!
    var eventlatitude: CLLocationDegrees!
    var eventlongitude: CLLocationDegrees!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if eventDetail == nil {
            eventDetail =  " "
        }

        if eventname == nil {
        eventname = " "
            
        }
        
        if eventlongitude == nil {
            eventlongitude = CLLocationDegrees(0)
        }
        if eventlatitude == nil {
                   eventlatitude = CLLocationDegrees(0)
               }
        
        eventName.text = eventname
        DetailName.text = eventDetail
        
        //what changes goes here!!!!
        var location = CLLocationCoordinate2DMake(eventlatitude, eventlongitude)
        
        var span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        
        var region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        mapView.setCenter(location, animated: true)
        
        let annotation = LocationAnnotation(coordinate: location, title: eventDetail, subtitle: "More details")
        mapView.addAnnotation(annotation)
       
        
        
     
   
        
        
    }
    

    @IBAction func notificationButtom(_ sender: Any) {
        let alert = UIAlertController(title: "Bluetooth Event Check-In System", message: "Please Open Bluetooth in your Setting", preferredStyle: .alert)
        let subButton = UIAlertAction(title: "Already Opened, Proceed", style: .default, handler: self.sub)
        let cancelButton = UIAlertAction(title:"Cancel",style: .cancel,handler:nil)
        alert.addAction(subButton)
        alert.addAction(cancelButton)
        self.present(alert,animated: true,completion: nil)
    }
    
    func sub(alert: UIAlertAction!) {
        performSegue(withIdentifier: "LastPage", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func websiteOpen(_ sender: Any) {
      
        let vc = SFSafariViewController(url: URL(string: "https://bcpa.evenue.net/cgi-bin/ncommerce3/EVExecMacro?linkID=bcpa&evm=myac&msgCode=32000&shopperContext=ST&returnURL=/cgi-bin/ncommerce3/SEGetGroupList%3FlinkID%3Dbcpa%26groupCode%3D%26RSRC%3D%26RDAT%3D%26shopperContext%3DST&url=/cgi-bin/ncommerce3/SEGetGroupList%3FlinkID%3Dbcpa%26groupCode%3D%26RSRC%3D%26RDAT%3D%26shopperContext%3DST")!)
        present(vc, animated: true)
    }
    
}
