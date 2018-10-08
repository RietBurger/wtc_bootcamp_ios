//
//  SecondViewController.swift
//  ex00
//
//  Created by Jeanette Henriette BURGER on 2018/10/08.
//  Copyright © 2018 Jeanette Henriette BURGER. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var lat : Double = -26.194617
var long : Double = 28.034150

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    /*********** from vids
    var locationManager = CLLocationManager()
    **************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map(lat: lat, long: long)
        
        
        
        /*********** from vids
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//        locationManager.distanceFilter = 10
//        locationManager.startUpdatingLocation()
        **************/
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func map(lat: Double, long: Double) {
        let location = CLLocationCoordinate2DMake(lat, long)
        let span = MKCoordinateSpanMake(0.002, 0.002)
        let region = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: false)
    }
    
      /*********** from vids
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        print("Location updated !")
    }
**************/
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

