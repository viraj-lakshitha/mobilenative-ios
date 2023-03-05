//
//  ContentView.swift
//  PracticeForPracticalExam
//
//  Created by Viraj Lakshitha Bandara on 2023-02-28.
//

import SwiftUI

struct FruitModel: Identifiable, Codable { // Identifiable used to make the each element or FruitModel we are creating to be identified. Codable used give property encode/decode to Json
    var id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = [] {
        didSet { // This function will call, if the you make any changes to 'fruitArray'
            saveData()
        }
    }
    @Published var isLoading: Bool = false
    let fruitKey = "fruit_array"
    
    init() {
        getFruit()
    }
    
    func getFruit() {
//        Commented following codes, since we have enable the UserDefault Storage hold previous items.
//        isLoading = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.fruitArray.append(FruitModel(name: "Orange", count: 3))
//            self.fruitArray.append(FruitModel(name: "Watermelon", count: 4))
//            self.fruitArray.append(FruitModel(name: "Banana", count: 5))
//            self.isLoading = false
//        }
        
        guard
            let data = UserDefaults.standard.data(forKey: fruitKey),
            let savedItem = try? JSONDecoder().decode([FruitModel].self, from: data)
        else { return }
        
        self.fruitArray = savedItem
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
    
    // If you're directly dealing with the View, then use AppStorage if not use UserDefault
    func saveData() {
        if let encodedData = try? JSONEncoder().encode(fruitArray) {
            UserDefaults.standard.set(encodedData, forKey: fruitKey)
        }
    }
}

struct ContentView: View {
    
    // @StateObject - If the View reload, what ever the variable holding this StateObject property wrapper doesn't make any change => This will persist the data
    // @StateObject - USE THIS FOR CREATION OR INIT
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    // But, If you use the @ObservedObject property wrapper then it will restore to initial version => This will not persist the data
    // @ObservedObject - USE THIS FOR SUBVIEWS
    // @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .navigationBarItems(trailing:
                                    NavigationLink(destination: SecondView(fruitViewModel: fruitViewModel), label: {
                Image(systemName: "arrow.right")
                    .font(.title)
            })
            )
//            .onAppear {
//                fruitViewModel.getFruit()
//            }
        }
    }
}

struct SecondView: View {
    
    @Environment(\.presentationMode) var presentationMode
    // When we are using something that is coming from parent view like this, use the ObservedObject, otherwise previous states will be remain there
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
