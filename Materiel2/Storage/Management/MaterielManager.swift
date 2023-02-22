//
//  MaterielManagement.swift
//  Materiel2
//
//  Created by Louis REY on 17/02/2023.
//

import Foundation

struct MaterielManager {
    var materielList: [Materiel]
    let storage: CoreDataStorage = CoreDataStorage()
    
    init() {
        materielList = storage.fetchMaterielList()
    }
    
    @discardableResult
    mutating func addMateriel(withName materielName: String, materielPrice: Int) -> Materiel {
        let newMateriel = Materiel(nameObject: materielName, price: materielPrice)
        materielList.append(newMateriel)
       storage.addNewMateriel(materiel: newMateriel)
       return newMateriel
    }
    
    mutating func toggleMateriel(withId materielId: UUID) {
        if let materielIndex = materielList.firstIndex(where: {(t) -> Bool in
            t.id == materielId }) {
            materielList[materielIndex].isDone.toggle()
//            storage.updateMateriel(materiel: materielList[materielIndex])
        }
    }
}
