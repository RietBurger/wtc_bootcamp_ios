//
//  ViewController.swift
//  ex03
//
//  Created by Jeanette Henriette BURGER on 2018/10/01.
//  Copyright © 2018 Jeanette Henriette BURGER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var symbol = ""
    var input = ""
    var negFlag = ""
    var result = 0
    var answer = false
    var eqFlag = false
    var nr1 = 0;
    var nr2 = 0;
    
    @IBAction func one(_ sender: UIButton) {
        if ((displayLabel.text == " " || answer) && symbol != "") {
            displayLabel.text = "1"
            answer = false
        }
        else {
            displayLabel.text = displayLabel.text! + "1"
        }
        print("pressed button: 1");
    }
    
    @IBAction func two(_ sender: UIButton) {
        if ((displayLabel.text == " " || answer) && symbol != "") {
            displayLabel.text = "2"
            answer = false
        }
        else {
            displayLabel.text = displayLabel.text! + "2"
        }
        print("pressed button: 2");
    }
   
    @IBAction func three(_ sender: UIButton) {
        if ((displayLabel.text == " " || answer) && symbol != "") {
            displayLabel.text = "3"
            answer = false
        }
        else {
            displayLabel.text = displayLabel.text! + "3"
        }
        print("pressed button: 3");
    }
    
    @IBAction func four(_ sender: UIButton) {
        if ((displayLabel.text == " " || answer) && symbol != "") {
            displayLabel.text = "4"
            answer = false
        }
        else {
            displayLabel.text = displayLabel.text! + "4"
        }
        print("pressed button: 4");
    }

    @IBAction func five(_ sender: UIButton) {
        if ((displayLabel.text == " " || answer) && symbol != "") {
            displayLabel.text = "5"
            answer = false
        }
        else {
            displayLabel.text = displayLabel.text! + "5"
        }
        print("pressed button: 5");
    }

    @IBAction func six(_ sender: UIButton) {
        if ((displayLabel.text == " " || answer) && symbol != "") {
            displayLabel.text = "6"
            answer = false
        }
        else {
            displayLabel.text = displayLabel.text! + "6"
        }
        print("pressed button: 6");
    }

    @IBAction func seven(_ sender: UIButton) {
        if ((displayLabel.text == " " || answer) && symbol != "") {
            displayLabel.text = "7"
            answer = false
        }
        else {
            displayLabel.text = displayLabel.text! + "7"
        }
        print("pressed button: 7");
    }

    @IBAction func eight(_ sender: UIButton) {
        if ((displayLabel.text == " " || answer) && symbol != "") {
            displayLabel.text = "8"
            answer = false
        }
        else {
            displayLabel.text = displayLabel.text! + "8"
        }
        print("pressed button: 8");
    }

    @IBAction func nine(_ sender: UIButton) {
        if ((displayLabel.text == " " || answer) && symbol != "") {
            displayLabel.text = "9"
            answer = false
        }
        else {
            displayLabel.text = displayLabel.text! + "9"
        }
        print("pressed button: 9");
    }

    @IBAction func zero(_ sender: UIButton) {
        if ((displayLabel.text == " " || answer) && symbol != "") {
            displayLabel.text = "0"
            answer = false
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
        if (displayLabel.text!.contains("-"))
        {
            negFlag = "-"
        }
        if (negFlag != "-")
        {
            input = "-" + displayLabel.text!
            displayLabel.text = input
            input = ""
            negFlag = ""
        }
        print(input)
        print("pressed button: neg");
    }

    @IBAction func add(_ sender: UIButton) {
        input = displayLabel.text!
        displayLabel.text = " "
        symbol = "+";
        answer = false
        print("pressed button: plus");
    }

    @IBAction func multiply(_ sender: UIButton) {
        input = displayLabel.text!
        displayLabel.text! = " "
        symbol = "*"
        answer = false
        print("pressed button: multiply");
    }

    @IBAction func minus(_ sender: UIButton) {
        input = displayLabel.text!
        displayLabel.text = " "
        symbol = "-"
        answer = false
        print("pressed button: minus");
    }

    @IBAction func devide(_ sender: UIButton) {
        input = displayLabel.text!
        displayLabel.text = " "
        symbol = "/"
        answer = false
        print("pressed button: divide");
    }

    @IBOutlet weak var errorLabel: UILabel!
    
    func displayError()
    {
        errorLabel.text = "ERROR"
    }
    
    @IBAction func equal(_ sender: UIButton) {
        
        
        if (errorLabel.text == "ERROR")
        {
            errorLabel.text = ""
        }
        if (!eqFlag)
        {
            nr2 = (displayLabel.text! as NSString).integerValue
        }
        else
        {
            nr1 = (input as NSString).integerValue
            nr2 = (displayLabel.text! as NSString).integerValue
        }
        print("this is input")
        print(input)
        if (symbol == "+")
        {
            result = nr1 + nr2;
            displayLabel.text = String(result)
//            symbol = ""
            answer = true
            nr2 = nr1
        }
        else if (symbol == "/")
        {
            if (nr2 == 0)
            {
                displayError();
            }
            else {
                result = nr1 / nr2;
                displayLabel.text = String(result)
//                symbol = ""
                answer = true
            }
        }
        else if (symbol == "-")
        {
            result = nr1 - nr2;
            displayLabel.text = String(result)
//            symbol = ""
            answer = true
        }
        else if (symbol == "*")
        {
            result = nr1 * nr2;
            displayLabel.text = String(result)
//            symbol = ""
            answer = true
        }
        nr1 = nr2
        eqFlag = true
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

