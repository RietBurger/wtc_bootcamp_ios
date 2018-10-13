//
//  Information+CoreDataClass.swift
//  
//
//  Created by Jeanette Henriette BURGER on 2018/10/11.
//
//

import Foundation
import CoreData


public class Articles: NSManagedObject {

    public var Title: String?
    public var Content: String?
    public var Language: String?
    public var Image: NSData?
    public var Creation_date: NSDate?
    public var Modification_date: NSDate?
    
    override var description: String {
        var output = "this is description"
        return output
    }
    
}
