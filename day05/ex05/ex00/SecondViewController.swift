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

var pins : [MKPointAnnotation] = []
var selectedPin : MKPointAnnotation?
var selected = false

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
    
    override func viewWillAppear(_ animated: Bool) {
        
        if selected == true {
            centerMapOnLocation(location:(selectedPin?.coordinate)!)
            selected = false
        } else {
            map(lat: lat, long: long, title: "Ecole 42", subtitle: "96 Boulevard Bessieres, Paris, France")
        }
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
            
            centerMapOnLocation(location: self.mapView.userLocation.coordinate)
            
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
        let cnt = locations.placeslist.count
        for i in stride(from: 0, to: cnt, by: +1) {
            let annotation1 = MKPointAnnotation()
            annotation1.coordinate.latitude = locations.placeslist[i].1
            annotation1.coordinate.longitude = locations.placeslist[i].2
            annotation1.title = locations.placeslist[i].0
            annotation1.subtitle = locations.placeslist[i].3
            mapView.addAnnotation(annotation1)
            pins.append(annotation1)
        }
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
    
    let regionRadius: CLLocationDistance = 250
    func centerMapOnLocation(location: CLLocationCoordinate2D) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

