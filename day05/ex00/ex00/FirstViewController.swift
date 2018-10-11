//
//  FirstViewController.swift
//  ex00
//
//  Created by Jeanette Henriette BURGER on 2018/10/08.
//  Copyright © 2018 Jeanette Henriette BURGER. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var locationsList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
}

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.placeslist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let(list) = locations.placeslist[indexPath.row]
        
        cell.textLabel?.text = list
        return cell
    }
//    cell.titleText?.text = "lat and long 84 Albertina Sisulu str"
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

