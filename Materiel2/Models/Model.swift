//
//  Model.swift
//  Materiel2
//
//  Created by Louis REY on 30/12/2022.
//

import Foundation

struct Materiel: Identifiable {
    var id = UUID()
    var nameObject: String
    var price: Int
    var isDone: Bool = false
}

