//
//  HistoryView.swift
//  TriangleAreaCalculator
//
//  Created by Viraj Lakshitha Bandara on 2023-03-17.
//

import SwiftUI

struct HistoryView: View {
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    @AppStorage("calculation_history") var calculateHistory: Data = Data()
    
    @State var altitude: String = ""
    @State var base: String = ""
    @State var hypotenuse: String = ""
    @State var area: String = ""
    @State var perimeter: String = ""
    
    func updateCalcHistory() {
        do {
            let history = try decoder.decode(History.self, from: calculateHistory)
            self.altitude = history.altitude
            self.base = history.base
            self.hypotenuse = history.hypotenuse
            self.perimeter = history.perimeter
            self.area = history.area
        } catch {
            print("[HistoryView] - ERROR: Unable to decode the values from app storage")
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if !(altitude.isEmpty && base.isEmpty && hypotenuse.isEmpty && perimeter.isEmpty && area.isEmpty) {
                    HStack {
                        Text("Altitude")
                        Spacer()
                        Text(altitude)
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Text("Base")
                        Spacer()
                        Text(base)
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Text("Hypotenues")
                        Spacer()
                        Text(hypotenuse)
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Text("Perimeter")
                        Spacer()
                        Text(perimeter)
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Text("Area")
                        Spacer()
                        Text(area)
                    }
                    .padding(.bottom)
                } else {
                    Text("No History Found!")
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationTitle("Last Calculation")
            .onAppear {
                updateCalcHistory()
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
