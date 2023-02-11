//
//  Details+CoreDataProperties.swift
//  Lidavi_Assignment
//
//  Created by Viswanath on 10/02/23.
//
//

import Foundation
import CoreData


extension Details {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Details> {
        return NSFetchRequest<Details>(entityName: "Details")
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?

}

extension Details : Identifiable {

}
