//
//  ViewController.swift
//  siri
//
//  Created by Jeanette Henriette BURGER on 2018/10/10.
//  Copyright © 2018 Jeanette Henriette BURGER. All rights reserved.
//

import UIKit
import RecastAI

class ViewController: UIViewController {
    
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
        self.bot?.textRequest(str!, successHandler: { (Response) in
            if Response.intent()?.slug == nil {
                self.err()
            } else {
                self.label.text = Response.intent()?.description
            }
            self.textIn.text = ""
            print(Response)
        }, failureHandle : { (Error) in
            self.err()
        })
    }
    
    func err() {
        self.label.text = "Error"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

