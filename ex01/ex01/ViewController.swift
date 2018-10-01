//
//  ViewController.swift
//  ex01
//
//  Created by Jeanette Henriette BURGER on 2018/10/01.
//  Copyright © 2018 Jeanette Henriette BURGER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBAction func clickButton(_ sender: UIButton) {
        helloLabel.text = "Hello World !"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //        print("awakeFromNib")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        print("viewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        print("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //        print("viewWillDisappear")
    }
    
    deinit {
        //        print("deinit")
    }
}

