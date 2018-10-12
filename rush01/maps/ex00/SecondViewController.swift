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

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segments: UISegmentedControl!

    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map(lat: lat, long: long, title: "home", subtitle: "you should know...")
    myLocation()
//    getSpecifiedDirections()
    
    }
    
    //SEARCH fts
    @IBAction func searchButton(_ sender: UIBarButtonItem) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        let searchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
//        var name: String?
//        var latitude: Double?
//        var longitude: Double?
//        var sub: String?
        
        activeSearch.start { (response, error) in
            
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            if response == nil {
                print("error")
            } else {
//                DispatchQueue.main.async {
                // remove all annotations
                
                // getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                let sub = response?.mapItems.description
                print(sub)
                
//                for res in (response?.mapItems)! {
//                    DispatchQueue.main.async {
//
//                    name = res.placemark.name
//                    latitude = res.placemark.coordinate.latitude
//                    longitude = res.placemark.coordinate.longitude
//                    sub = res.placemark.subtitle
//                    }
//                    }
//                DispatchQueue.main.async {
                    self.map(lat: latitude!, long: longitude!, title: searchBar.text!, subtitle: sub!)

//                }
                
            }
            
        }
    }
    
    
    //MARK: mapkit delegates
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 3.0
        return renderer
        
    }
    
    @IBAction func viewMyLocation(_ sender: UIButton) {

            myLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if selected == true {
            centerMapOnLocation(location:(selectedPin?.coordinate)!)
            selected = false
        } else {
            myLocation()
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
//            map(lat: self.mapView.userLocation.coordinate.latitude, long: self.mapView.userLocation.coordinate.longitude, title: "home", subtitle: "you should know...")
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
        self.addTempPins(lat: lat, long: long, title: title, subtitle: subtitle)
        
        
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
    
    func addTempPins(lat: Double, long: Double, title: String, subtitle: String) {
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate.latitude = lat
        annotation1.coordinate.longitude = long
        annotation1.title = title
        annotation1.subtitle = subtitle
        mapView.addAnnotation(annotation1)
        pins.append(annotation1)
        print(pins)
    }
    
    //custom annotations/pins
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       
        if annotation is MKUserLocation {
            return nil
        }
        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named: "icons8-marker-64")
        annotationView.backgroundColor = UIColor.lightText
        annotationView.canShowCallout = true
        return annotationView
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

    func getSpecifiedDirections() {
        let sourceLocation = CLLocationCoordinate2D(latitude: -26.193457, longitude: 28.035124)
        let destLocation = CLLocationCoordinate2D(latitude: -26.191609, longitude: 28.033149)
        
        let sourcePin = addTempPins(lat: sourceLocation.latitude, long: sourceLocation.longitude, title: "source", subtitle: "come from")
        let destPin = addTempPins(lat: destLocation.latitude, long: destLocation.longitude, title: "destination", subtitle: "going to")
        //addTempPins() also adds annotations...
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation)
        let destPlacemark = MKPlacemark(coordinate: destLocation)
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = MKMapItem(placemark: sourcePlacemark)
        directionRequest.destination = MKMapItem(placemark: destPlacemark)
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { (response, error) in
            guard let directionResponse = response else {
                if let error = error {
                    print("we have an error getting directions \(error.localizedDescription)")
                }
                return
            }
            let route = directionResponse.routes[0]
            self.mapView.add(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
            
        }
        self.mapView.delegate = self

    }
}

