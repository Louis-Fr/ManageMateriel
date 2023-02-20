//
//  ContentView.swift
//  Materiel2
//
//  Created by Louis REY on 30/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var materielManager = MaterielManager()
    @State var userMateriel: String = ""
    @State var userPriceMateriel: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                HStack {
                    TextField("Name Object", text: $userMateriel)
                        .bold()
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Enter you price", value: $userPriceMateriel, formatter: NumberFormatter())
                    
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    Button {
                        createMateriel()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                }.padding()
                
                ForEach(materielManager.materielList) { index in
                    MaterielCell(materiel: index).bold()
                }
            }
            
        }
        
    }
    
    func createMateriel() {
        if userMateriel.count > 4 {
            materielManager.addMateriel(withName: userMateriel, materielPrice: userPriceMateriel)
            userMateriel = ""
            userPriceMateriel = userPriceMateriel
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
