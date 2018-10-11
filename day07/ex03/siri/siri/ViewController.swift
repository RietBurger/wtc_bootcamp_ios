//
//  ViewController.swift
//  siri
//
//  Created by Jeanette Henriette BURGER on 2018/10/10.
//  Copyright © 2018 Jeanette Henriette BURGER. All rights reserved.
//

import UIKit
import RecastAI
import ForecastIO

class ViewController: UIViewController {

    let client = DarkSkyClient(apiKey: "541bc817282e4d8e94bcabfcc327cf0f")
    var name = ""
    var lat: Double = 0.0
    var long: Double = 0.0
    var temp: Double = 0.0
    var summary: String = ""
    
    var bot : RecastAIClient?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textIn: UITextField!

    @IBAction func submit(_ sender: UIButton) {
        makeRequest()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bot = RecastAIClient(token : "5238141f8e8d3e17d6a0cc915cb9c07c")
        self.bot = RecastAIClient(token : "5238141f8e8d3e17d6a0cc915cb9c07c", language : "en")
    }

    func makeRequest() {
        let str = textIn.text
        if (str?.isEmpty)! {
            self.err()
        } else {

        client.units = .si
        client.language = .english
        self.bot?.textRequest(str!, successHandler: { (Response) in
            if Response.intent()?.slug == nil {
                self.err()
            } else {
                let locationSave = Response.get(entity: "location")
                if locationSave == nil {
                    self.err()
                } else {
                    self.name = locationSave!["raw"] as! String
                    self.lat = locationSave!["lat"] as! Double
                    self.long = locationSave!["lng"] as! Double
                    if self.lat != nil && self.long != nil {
                        self.client.getForecast(latitude: self.lat, longitude: self.long) { result in
                             DispatchQueue.main.async {
                            switch result {
                            case .success (let currentForecast, _):
                                self.temp = (currentForecast.currently?.temperature)!
                                self.summary = (currentForecast.currently?.summary)!
                            case .failure(let error):
                                print(error)
                            }
                                self.label.text = (self.name) + " " + (self.summary) + " " + (String(describing: self.temp))
                        
                            }
                        }
                    }
                }
            }
            self.textIn.text = ""
        }, failureHandle : { (Error) in
            self.err()
        })
    }
    }
    
    func err() {
        self.label.text = "Error"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

