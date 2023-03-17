//
//  PizzaList.swift
//  PizzaApp
//
//  Created by Viraj Lakshitha Bandara on 2023-03-01.
//

import SwiftUI

struct PizzaList: View {
    
    @ObservedObject var viewModel: PizzaViewModel
    
    @State private var isSheetShowing =  false
    @State private var selectedIndex = 0
    
    func renderPizza() -> [PizzaEntity] {
        switch selectedIndex {
        case 1:
            return viewModel.filterPizzaWithType(pizzaType: "Meat")
        case 2:
            return viewModel.filterPizzaWithType(pizzaType: "Veggie")
        default:
            return viewModel.savedPizzaData
        }
    }

    var body: some View {
        NavigationStack{
            VStack{
                Picker("Pizza", selection: $selectedIndex){
                    Text("All").tag(0)
                    Text("Meat").tag(1)
                    Text("Veggie").tag(2)
                }.pickerStyle(.segmented)
                
                List{
                    ForEach(renderPizza()) { pizza in
                        NavigationLink {
                            PizzaView(selectedPizza: pizza, viewModel: viewModel)
                        } label: {
                            HStack {
                                Image("\(pizza.imageName ?? "")")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(50)
                                Text("\(pizza.name ?? "")")
                            }
                        }
                    }
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem{
                    Button {
                        isSheetShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing){
                AddNewPizza(viewModel: viewModel)
            }
        }
    }
}

struct PizzaList_Previews: PreviewProvider {
    static var previews: some View {
        PizzaList(viewModel: PizzaViewModel()) // PizzaViewModel() initialized only for developement purposes
    }
}
