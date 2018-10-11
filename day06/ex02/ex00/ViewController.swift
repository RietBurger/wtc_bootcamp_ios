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
        
        bounce.elasticity = 0.9
        bounce.friction = 0.1
        gravity.magnitude = 5
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        animator.addBehavior(bounce)
    }
    
    ////////////////////// GESTURES ///////////////////////////////
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        //set center
        let Center = sender.location(in: view)
        
        //radius
        let Width = CGFloat(100)
        let Height = Width
        
        //create new view
        
        let circleView = CircleView(frame: CGRect(x: Center.x - Height/2, y: Center.y - Width/2, width: Width, height: Height), shape: Int(arc4random_uniform(2) + 0))
        gravity.addItem(circleView)
        collision.addItem(circleView)
        bounce.addItem(circleView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panning));
        circleView.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(resize))
        circleView.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate))
        circleView.addGestureRecognizer(rotateGesture)
 
        view.addSubview(circleView)
        
    }
    
    @objc func rotate(rotateGesture: UIRotationGestureRecognizer) {
        switch rotateGesture.state {
        case .began:
            self.gravity.removeItem(rotateGesture.view!);
        case .changed:
            self.collision.removeItem(rotateGesture.view!);
            self.bounce.removeItem(rotateGesture.view!)
            rotateGesture.view!.transform = rotateGesture.view!.transform.rotated(by: rotateGesture.rotation);
            rotateGesture.rotation = 0;
            self.collision.addItem(rotateGesture.view!);
            self.bounce.addItem(rotateGesture.view!)
            self.animator.updateItem(usingCurrentState: rotateGesture.view!);
        case .ended:
            self.gravity.addItem(rotateGesture.view!);
        default:
            break
        }
    }

    @objc func resize(pinchGesture: UIPinchGestureRecognizer) {
        let view = pinchGesture.view as! CircleView
        
        switch pinchGesture.state {
        case .began:
            self.gravity.removeItem(view)
        case .changed:
//            collision.accessibilityDecrement()
//            bounce.accessibilityDecrement()
            collision.removeItem(view)
            bounce.removeItem(view)
            if (view.bounds.size.width <= 20) {
                view.bounds.size.width = 21
                view.bounds.size.height = 21
            } else if (view.bounds.size.width >= 151) {
                view.bounds.size.width = 150
                view.bounds.size.height = 150
            } else {
                view.bounds.size.width = view.bounds.size.width * pinchGesture.scale
                view.bounds.size.height = view.bounds.size.height * pinchGesture.scale
            }
//            collision.accessibilityActivate()
//            bounce.accessibilityActivate()
            collision.addItem(view)
            bounce.addItem(view)
            animator.updateItem(usingCurrentState: view)
        case .ended:
//            collision.accessibilityActivate()
////            bounce.accessibilityActivate()
//            bounce.addItem(view)
//            animator.updateItem(usingCurrentState: view)
            gravity.addItem(view)
        default:
            break
        }
    }
    
    @objc func panning(panGesture: UIPanGestureRecognizer) {
        switch panGesture.state {
        case .began:
            self.gravity.removeItem(panGesture.view!);
        case .changed:
            panGesture.view?.center = panGesture.location(in: self.view);
            self.animator.updateItem(usingCurrentState: panGesture.view!);
        case .ended:
            self.gravity.addItem(panGesture.view!);
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

