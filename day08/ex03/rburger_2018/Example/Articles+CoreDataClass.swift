//
//  Articles+CoreDataClass.swift
//  
//
//  Created by Jeanette Henriette BURGER on 2018/10/11.
//
//

import Foundation
import CoreData

@objc(Articles)
public class Articles: NSManagedObject {
    public var title: String?
    public var content: String?
    public var language: String?
    public var image: NSObject?
    public var creation_date: NSDate?
    public var modification_date: NSObject?
    
    override var description : String {
        let output = "this is description"
        return output
    }
}
