//
//  MaterielView.swift
//  Materiel2
//
//  Created by Louis REY on 30/12/2022.
//

import SwiftUI

struct MaterielView: View {
    let materiel: Materiel
    
    var body: some View {
        
        VStack {
            HStack {
                Text(materiel.nameObject)
            }
        }
    }
}

struct MaterielView_Previews: PreviewProvider {
    static var previews: some View {
        MaterielView(materiel: Materiel(nameObject: "xbox", price: 100))
    }
}


