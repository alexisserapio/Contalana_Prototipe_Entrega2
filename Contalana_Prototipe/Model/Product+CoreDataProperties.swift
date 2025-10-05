//
//  Product+CoreDataProperties.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 04/10/25.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var id: Int16
    @NSManaged public var product_name: String?
    @NSManaged public var product_description: String?
    @NSManaged public var category: String?
    @NSManaged public var amount: Int16
    @NSManaged public var price: Float
    @NSManaged public var supplier: String?
    @NSManaged public var location: String?
    @NSManaged public var image: Data?
    @NSManaged public var code: String?
    @NSManaged public var brand: String?
    @NSManaged public var added_product_date: Date?
    @NSManaged public var last_purchase_date: Date?
    @NSManaged public var min_price: Float
    @NSManaged public var max_price: Float
    @NSManaged public var branch: String?

}

extension Product : Identifiable {

}
