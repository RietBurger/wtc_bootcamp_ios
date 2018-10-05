//
//  ViewController.swift
//  tables
//
//  Created by Jeanette Henriette BURGER on 2018/10/04.
//  Copyright © 2018 Jeanette Henriette BURGER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Data.noted.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Notes")
        cell?.textLabel?.text = Data.noted[indexPath.row].0 + Data.noted[indexPath.row].2
        cell?.detailTextLabel?.text = Data.noted[indexPath.row].1
        
        return cell!
    }
    
    @IBAction func unWindSegue(segue: UIStoryboardSegue) {
        print(segue.identifier)
    }
}

