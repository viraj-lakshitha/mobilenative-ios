//
//  PizzaView.swift
//  PizzaApp
//
//  Created by Viraj Lakshitha Bandara on 2023-03-10.
//

import SwiftUI

struct PizzaView: View {
    
    var selectedPizza: PizzaEntity
    @ObservedObject var viewModel: PizzaViewModel
    @State var isFavourite: Bool
    
    init(selectedPizza: PizzaEntity, viewModel: PizzaViewModel) {
        self.viewModel = viewModel
        self.selectedPizza = selectedPizza
        self.isFavourite = selectedPizza.isFavourite
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(selectedPizza.imageName ?? "")
                    .resizable()
                    .frame(height: 200)
                
                Form {
                    Section {
                        Text("\(selectedPizza.ingredients ?? "")")
                            .multilineTextAlignment(.leading)
                    } header: {
                        Text("Ingredient".uppercased())
                    }
                    
                    Toggle("Favourite", isOn: $isFavourite)
                }
            }
            .navigationTitle(selectedPizza.name ?? "")
            .navigationBarTitleDisplayMode(.large)

        }
    }
}

struct PizzaView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaView(selectedPizza: PizzaEntity(), viewModel: PizzaViewModel())
    }
}
