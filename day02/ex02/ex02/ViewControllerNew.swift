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
    
    func printinfo() {
        print(PersName.text!)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy hh:mm:ss"
        print (dateFormatter.string(from: DateSelected.date))
        //            self.view.endEditing(true) // ??
        print(Description.text!)
        print("");
    }
    
    @IBAction func DoneSave(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "saved", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if DateSelected.date >= Date() {
            //ex02 - uncomment this:
            printinfo()
            if PersName.text != nil {
//                let input = Data.noted(PersName.text!, Description.text!, "date")]
//                Data.noted[0] = PersName.text!
//                Data.noted[0] = PersName.text!
//                Data.noted[1] =
                print("name inserted")
            } else {
                print("save unsuccessful")
            }
        } else {
            print("Select future date")
            print("")
        }
    }
    
//    @IBAction func backButton(_ sender: UIButton) {
//        print("backbutton clicked")
//        performSegue(withIdentifier: "backSegue", sender: "Foo")
//    }
}
