//
//  MaterielDetailView.swift
//  Materiel2
//
//  Created by Louis REY on 30/12/2022.
//

import SwiftUI

struct MaterielDetailView: View {
    
    let viewModel: MaterielViewModel
    
    var body: some View {
        /* VStack {
            Text(viewModel.materiel.objet)
            Text(viewModel.materiel.price.description)
            Text(viewModel.materiel.Modification.rawValue)
        } */
        
        ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.brown)
                        .frame(width: 300, height: 170)
                        .shadow(radius: 10)
                    VStack {
                        Text(viewModel.materiel.nameObject)
                            .font(.title2)
                            .bold()
                        Text("\(viewModel.materiel.category.rawValue)")
                            .font(.callout)
                        Text((viewModel.materiel.price.description) + "€")
                            .font(.title3)
                            .padding()
                        
                        if viewModel.materiel.modification ==  .modifié {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.orange)
                        } else if viewModel.materiel.modification ==  .origine {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.blue)
                        }
                    }
                    
                }

    }
}

struct MaterielDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MaterielDetailView(viewModel: MaterielViewModel(materiel: .materiel1))
    }
}
