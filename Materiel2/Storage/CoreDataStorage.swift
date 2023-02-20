//
//  CoreDataStorage.swift
//  Materiel2
//
//  Created by Louis REY on 17/02/2023.
//

import Foundation
import CoreData

class CoreDataStorage: ObservableObject {
    
    /// File configuration of CoreData Container
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Materiel")
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
    
}
