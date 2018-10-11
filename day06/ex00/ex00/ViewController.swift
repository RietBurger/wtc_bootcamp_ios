//
//  ViewController.swift
//  ex00
//
//  Created by Jeanette Henriette BURGER on 2018/10/09.
//  Copyright © 2018 Jeanette Henriette BURGER. All rights reserved.
//

import UIKit

var selected = true

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with: UIEvent?) {
        for touch in touches {
            
            //set center
            let Center = touch.location(in: view)

            //radius
            let Width = CGFloat(100)
            let Height = Width

            //create new view
            
            let circleView = CircleView(frame: CGRect(x: Center.x - Height/2, y: Center.y - Width/2, width: Width, height: Height))
            view.addSubview(circleView)

            }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

