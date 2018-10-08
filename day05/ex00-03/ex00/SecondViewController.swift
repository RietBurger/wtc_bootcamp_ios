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

var lat : Double = 48.896878
var long : Double = 2.318361

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segments: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        map(lat: lat, long: long)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func map(lat: Double, long: Double) {
        let location = CLLocationCoordinate2DMake(lat, long)
        let span = MKCoordinateSpanMake(0.002, 0.002)
        let region = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: false)
//        mapView.mapType = .satellite
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Ecole 42"
        annotation.subtitle = "96 Boulevard Bessieres, Paris, France"
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func setSegment(_ sender: UISegmentedControl) {
        let getIndex = segments.selectedSegmentIndex
        
        switch getIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            mapView.mapType = .standard
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

