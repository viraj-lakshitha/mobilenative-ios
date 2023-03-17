//
//  ContentView.swift
//  iCalories
//
//  Created by Viraj Lakshitha Bandara on 2023-03-12.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var foods: FetchedResults<Food>
    
    @State private var showingAddView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(Int(totalCaloriesToday())) Kcal today")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                List {
                    ForEach(foods) { food in
                        NavigationLink(destination: EditFoodView(food: food)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(food.name ?? "N/A")
                                        .bold()
                                    Text("\(Int(food.calories)) ")+Text("calories").foregroundColor(.red)
                                }
                                Spacer()
                                Text(calcTime(date: food.date!))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: deleteFood)
                }
                .listStyle(.plain)
            }
            .navigationTitle("iCalories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add Food", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton() // This is coming from swift ui
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddFoodView()
            }
        }
    }
    
    private func deleteFood(offsets: IndexSet) {
        withAnimation {
            offsets.map { foods[$0] }.forEach(managedObjectContext.delete)
            DataController().save(context: managedObjectContext)
        }
    }
    
    private func totalCaloriesToday() -> Double {
        var calariesToday: Double = 0.0
        for item in foods {
            if Calendar.current.isDateInToday(item.date!) {
                calariesToday += item.calories
            }
        }
        return calariesToday
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
