//
//  ViewController.swift
//  ex02
//
//  Created by Jeanette Henriette BURGER on 2018/10/01.
//  Copyright © 2018 Jeanette Henriette BURGER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func one(_ sender: UIButton) {
        if (displayLabel.text == " ") {
            displayLabel.text = "1"
        }
        else {
            displayLabel.text = displayLabel.text! + "1"
        }
        print("pressed button: 1");
    }
    
    @IBAction func two(_ sender: UIButton) {
        if (displayLabel.text == " ") {
            displayLabel.text = "2"
        }
        else {
            displayLabel.text = displayLabel.text! + "2"
        }
        print("pressed button: 2");
    }
   
    @IBAction func three(_ sender: UIButton) {
        if (displayLabel.text == " ") {
            displayLabel.text = "3"
        }
        else {
            displayLabel.text = displayLabel.text! + "3"
        }
        print("pressed button: 3");
    }
    
    @IBAction func four(_ sender: UIButton) {
        if (displayLabel.text == " ") {
            displayLabel.text = "4"
        }
        else {
            displayLabel.text = displayLabel.text! + "4"
        }
        print("pressed button: 4");
    }

    @IBAction func five(_ sender: UIButton) {
        if (displayLabel.text == " ") {
            displayLabel.text = "5"
        }
        else {
            displayLabel.text = displayLabel.text! + "5"
        }
        print("pressed button: 5");
    }

    @IBAction func six(_ sender: UIButton) {
        if (displayLabel.text == " "){
            displayLabel.text = "6"
        }
        else {
            displayLabel.text = displayLabel.text! + "6"
        }
        print("pressed button: 6");
    }

    @IBAction func seven(_ sender: UIButton) {
        if (displayLabel.text == " ") {
            displayLabel.text = "7"
        }
        else {
            displayLabel.text = displayLabel.text! + "7"
        }
        print("pressed button: 7");
    }

    @IBAction func eight(_ sender: UIButton) {
        if (displayLabel.text == " " ) {
            displayLabel.text = "8"
        }
        else {
            displayLabel.text = displayLabel.text! + "8"
        }
        print("pressed button: 8");
    }

    @IBAction func nine(_ sender: UIButton) {
        if (displayLabel.text == " ") {
            displayLabel.text = "9"
        }
        else {
            displayLabel.text = displayLabel.text! + "9"
        }
        print("pressed button: 9");
    }

    @IBAction func zero(_ sender: UIButton) {
        if (displayLabel.text == " ") {
            displayLabel.text = "0"
        }
        else {
            displayLabel.text = displayLabel.text! + "0"
        }
        print("pressed button: 0");
    }

    @IBAction func clear(_ sender: UIButton) {
        displayLabel.text = " "
        print("pressed button: ac");
    }

    @IBAction func negValue(_ sender: UIButton) {
        print("pressed button: neg");
    }

    @IBAction func add(_ sender: UIButton) {
        print("pressed button: plus");
    }

    @IBAction func multiply(_ sender: UIButton) {
        print("pressed button: multiply");
    }

    @IBAction func minus(_ sender: UIButton) {
        print("pressed button: minus");
    }

    @IBAction func devide(_ sender: UIButton) {
        print("pressed button: divide");
    }

    @IBAction func equal(_ sender: UIButton) {
        
        print("pressed button: equal");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

