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

    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var bounce: UIDynamicItemBehavior!
    
//    var collisionDelegate: UICollisionBehaviorDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        
        animator = UIDynamicAnimator()
        gravity = UIGravityBehavior()
        collision = UICollisionBehavior()
        bounce = UIDynamicItemBehavior()
        collision.addBoundary(withIdentifier: "top" as NSCopying, from: CGPoint(x:0.0, y:0.0), to: CGPoint(x: view.bounds.size.width, y:0.0))
        collision.addBoundary(withIdentifier: "bottom" as NSCopying, from: CGPoint(x: 0, y: view.bounds.size.height), to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height))
        collision.addBoundary(withIdentifier: "left" as NSCopying, from: CGPoint(x: 0, y: 0), to: CGPoint(x: 0, y: view.bounds.size.height))
        collision.addBoundary(withIdentifier: "right" as NSCopying, from: CGPoint(x: view.bounds.size.width, y: 0), to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height))
        collision.translatesReferenceBoundsIntoBoundary = true
        
        bounce.elasticity = 0.5
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        animator.addBehavior(bounce)
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
            gravity.addItem(circleView)
            collision.addItem(circleView)
            bounce.addItem(circleView)
            view.addSubview(circleView)

            }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

