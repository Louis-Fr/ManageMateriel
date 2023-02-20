//
//  MaterielManagement.swift
//  Materiel2
//
//  Created by Louis REY on 17/02/2023.
//

import Foundation

struct MaterielManagement {
    let materielList: [Materiel]
    var storage: CoreDataStorage = CoreDataStorage()
    
    init() {
        materielList = storage.fetchMaterielList()
    }
    
}
