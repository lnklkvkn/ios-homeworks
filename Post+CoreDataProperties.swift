//
//  Post+CoreDataProperties.swift
//  Navigation
//
//  Created by ln on 10.06.2023.
//
//

import Foundation
import CoreData

@objc(CDPost)
public class CDPost: NSManagedObject {}

extension CDPost {
    @NSManaged public var autor: String?
    @NSManaged public var image: String?
    @NSManaged public var text: String?
    @NSManaged public var likes: Int64
    @NSManaged public var views: Int64
}

extension CDPost : Identifiable {}
