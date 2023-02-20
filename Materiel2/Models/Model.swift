//
//  Model.swift
//  Materiel2
//
//  Created by Louis REY on 30/12/2022.
//

import Foundation

struct Materiel: Identifiable, Hashable {
    let id = UUID()
    var nameObject: String
    var price: Int
    var modification: Modification
    var category: Category
}

enum Modification: String, CaseIterable {
    case modifié
    case origine
}

enum Category: String {
    case TV = "Télévision"
    case Smartphone = "Smartphone"
    case Computer = "Ordinateur"
    case Console = "Console"
    case Other = "Other"
}

extension Materiel {
    static var materiel: [Materiel] = [.materiel1, .materiel2, .materiel3]
    
    static var materiel1 = Materiel(nameObject: "TV SONY KDL", price: 150, modification: .origine, category: .TV)
    static var materiel2 = Materiel(nameObject: "Carte SD 128GB", price: 35, modification: .origine, category: .Other)
    static var materiel3 = Materiel(nameObject: "3DS XL", price: 90, modification: .modifié, category: .Console)
    
       // .init(objet: "test", price: 100, Modification: .origine, Category: .Other)
}
