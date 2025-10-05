//
//  DataManager.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 04/10/25.
//

import Foundation
import CoreData


class DataManager : NSObject {
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Mascotas")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
        
    }()
    
    
    func allProducts() -> [Product] {
        let request = Product.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error fetch mascotas: \(error)")
            return []
        }
    }
}
