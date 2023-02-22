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
    @State var userPrice: Int = 0
    
    var body: some View {
        
            VStack {
                HStack {
                    TextField("Name Object", text: $userMateriel)
                        .bold()
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    TextField("Price Object", value: $userPrice, formatter: NumberFormatter())
                        .bold()
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                
                Button(action: createMateriel, label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                }).disabled(userMateriel.count == 0)
                    .padding()
                    VStack(alignment: HorizontalAlignment.leading) {
                        ForEach(materielManager.materielList) { index in
                            MaterielCell(materiel: index)
                        .onTapGesture {
                            userTouchMateriel(index)
                            }
                        }
                        
                    }.padding()
                
                    
                }
                
        }
    
    func createMateriel() {
        if userMateriel.count > 0 {
            materielManager.addMateriel(withName: userMateriel, materielPrice: userPrice)
            userMateriel = ""
        }
    }
    
    
    
        func userTouchMateriel(_ materiel: Materiel) {
            materielManager.toggleMateriel(withId: materiel.id)
        }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
