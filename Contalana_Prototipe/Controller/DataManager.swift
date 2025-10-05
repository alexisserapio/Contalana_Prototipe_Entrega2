//
//  DataManager.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 04/10/25.
//

import Foundation
import CoreData

func createDB(){
    let dataBaseCreated = UserDefaults.standard
    guard dataBaseCreated.bool(forKey: "dataBaseCreated") != true else { return }
}
