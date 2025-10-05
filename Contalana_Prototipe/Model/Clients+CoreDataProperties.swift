//
//  Clients+CoreDataProperties.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 04/10/25.
//
//

import Foundation
import CoreData


extension Clients {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Clients> {
        return NSFetchRequest<Clients>(entityName: "Clients")
    }

    @NSManaged public var client_id: Int16
    @NSManaged public var target_client: String?
    @NSManaged public var principal_channel: String?
    @NSManaged public var avg_ticket: Float

}

extension Clients : Identifiable {

}
