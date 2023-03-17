//
//  ContentView.swift
//  TriangleAreaCalculator
//
//  Created by Viraj Lakshitha Bandara on 2023-03-17.
//

import SwiftUI

struct History {
    var base: String
    var altitude: String
    var hypotenuse: String
    var area: String
    var perimeter: String
}

struct ContentView: View {
    var body: some View {
        TabView {
            CalculationView().tabItem {
                Label("Calculator", systemImage: "sum")
            }
            HistoryView().tabItem {
                Label("History", systemImage: "list.bullet")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
