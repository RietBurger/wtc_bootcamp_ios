//
//  CircleView.swift
//  ex00
//
//  Created by Jeanette Henriette BURGER on 2018/10/09.
//  Copyright © 2018 Jeanette Henriette BURGER. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(),
                       green: .random(),
                       blue: .random(),
                       alpha: 1.0)
    }
}
///////////

class CircleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        UIColor.random().setFill()
        UIColor.random().setStroke()
        
        let shape: CGFloat = .random()
        
        //circle
        if shape > 0.5 {
            let path = UIBezierPath(ovalIn: rect)
            path.fill()
            path.stroke()
        } else {
            let path = UIBezierPath(rect: rect)
            path.fill()
            path.stroke()
        }

    }
}


