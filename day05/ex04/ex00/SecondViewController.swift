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

    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map(lat: lat, long: long, title: "Ecole 42", subtitle: "96 Boulevard Bessieres, Paris, France")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func viewMyLocation(_ sender: UIButton) {

            myLocation()
    }
    
    func myLocation()
    {
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
           
            mapView.showsUserLocation = true
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.distanceFilter = 10
            locationManager.startUpdatingLocation()
            
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        
        mapView.setRegion(region, animated: true)
    }
    
    func map(lat: Double, long: Double, title: String, subtitle: String) {
        let location = CLLocationCoordinate2DMake(lat, long)
        let span = MKCoordinateSpanMake(0.002, 0.002)
        let region = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
        //for pins
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = title
        annotation.subtitle = subtitle
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

