//
//  CoreDataStorage.swift
//  Materiel2
//
//  Created by Louis REY on 17/02/2023.
//

import Foundation
import CoreData

class CoreDataStorage {
    
    /// File configuration of CoreData Container
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "MaterielModel")
            container.loadPersistentStores { description, error in
                if let error = error {
                    fatalError("Unable to load persistent stores: \(error)")
                }
            }
            return container
        }()
    
    /// Context for manage interaction with container
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
   
    
    func fetchMaterielList() -> [Materiel] {
        let materielList: [Materiel]
        let fetchRequest: NSFetchRequest<CDMateriel> = CDMateriel.fetchRequest()
        
        if let rawMaterielList = try? context.fetch(fetchRequest) {
            materielList = rawMaterielList.compactMap({ (rawMateriel: CDMateriel) -> Materiel? in
                Materiel(fromCoreDataObject: rawMateriel)
            })
        } else {
            materielList = []
        }
     return materielList
    } /// End fetch
    
    
    func addNewMateriel(materiel: Materiel){
        let newMateriel = CDMateriel(context: context)
        newMateriel.id = materiel.id
        newMateriel.nameObject = materiel.nameObject
        newMateriel.price = Int16(materiel.price)
        newMateriel.isDone = materiel.isDone
        saveData()
    }
    
    func updateMateriel(materiel: Materiel) {
        if let existingTask = fetchCDMateriel(withId: materiel.id) {
            existingTask.nameObject = materiel.nameObject
            existingTask.price = Int16(materiel.price)
            existingTask.isDone = materiel.isDone
            saveData()
        }
    }
    
    // Modifify object
    private func fetchCDMateriel(withId materielId: UUID) -> CDMateriel? {
        let fetchRequest: NSFetchRequest<CDMateriel> = CDMateriel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", materielId as CVarArg)
        fetchRequest.fetchLimit = 1
        let fetchResult: [CDMateriel]? = try? context.fetch(fetchRequest)
        return fetchResult?.first
    }
    
    
    func saveData() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error during save")
            }
        }
   }
}



extension Materiel {
    init?(fromCoreDataObject coreDataObject: CDMateriel) {
        guard let id = coreDataObject.id,
              let nameObject =  coreDataObject.nameObject
        else {return nil}
        
        self.id = id
        self.nameObject = nameObject
        self.price = Int(coreDataObject.price)
        self.isDone = coreDataObject.isDone
    }
}
