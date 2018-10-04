//
//  ViewControllerNew.swift
//  ex02
//
//  Created by Jeanette Henriette BURGER on 2018/10/04.
//  Copyright © 2018 Jeanette Henriette BURGER. All rights reserved.
//

import UIKit

class ViewControllerNew: UIViewController {

    @IBOutlet weak var PersName: UITextField!
    @IBOutlet weak var DateSelected: UIDatePicker!
    @IBOutlet weak var Description: UITextView!
    
    
    @IBAction func DoneSave(_ sender: UIBarButtonItem) {
        if DateSelected.date >= Date() {
            print(PersName.text!)
            print(DateSelected.date)
            print(Description.text!)
            print("");
        } else {
            print("Select future date")
            print("")
        }
    }
}
