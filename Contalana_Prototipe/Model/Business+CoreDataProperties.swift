//
//  Business+CoreDataProperties.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 04/10/25.
//
//

import Foundation
import CoreData


extension Business {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Business> {
        return NSFetchRequest<Business>(entityName: "Business")
    }

    @NSManaged public var name: String?
    @NSManaged public var industry: String?
    @NSManaged public var country: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var timestamp: Date?
    @NSManaged public var num_employees: Int16
    @NSManaged public var branch: Int16
    @NSManaged public var horizontalAccuracy: Double
    @NSManaged public var best_selling_product: Int16
    @NSManaged public var social_media: String?

}

extension Business : Identifiable {

}
