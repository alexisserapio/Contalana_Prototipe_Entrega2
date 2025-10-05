//
//  Operations+CoreDataProperties.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 04/10/25.
//
//

import Foundation
import CoreData


extension Operations {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Operations> {
        return NSFetchRequest<Operations>(entityName: "Operations")
    }

    @NSManaged public var id: Int16
    @NSManaged public var type_operation: String?
    @NSManaged public var product_id: Int16
    @NSManaged public var price: Float

}

extension Operations : Identifiable {

}
