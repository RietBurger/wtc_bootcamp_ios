//
//  Articles+CoreDataProperties.swift
//  
//
//  Created by Jeanette Henriette BURGER on 2018/10/11.
//
//

import Foundation
import CoreData


extension Articles {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Articles> {
        return NSFetchRequest<Articles>(entityName: "Articles")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: NSObject?
    @NSManaged public var creation_date: NSDate?
    @NSManaged public var modification_date: NSObject?

}
