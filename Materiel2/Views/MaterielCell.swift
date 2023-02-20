//
//  MaterielView.swift
//  Materiel2
//
//  Created by Louis REY on 30/12/2022.
//

import SwiftUI

struct MaterielCell: View {
    let materiel: Materiel
    
    var body: some View {
        
        VStack {
            HStack {
                Text(materiel.nameObject)
                Text(materiel.price.description)
                Spacer()
                Image(systemName: materiel.isDone ? "checkmark.circle" : "circle")
            }.padding()
        }
    }
}

struct MaterielCell_Previews: PreviewProvider {
    static var previews: some View {
        MaterielCell(materiel: Materiel(nameObject: "xbox", price: 100))
    }
}


