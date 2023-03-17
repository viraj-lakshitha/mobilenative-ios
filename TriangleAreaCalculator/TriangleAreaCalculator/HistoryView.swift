//
//  HistoryView.swift
//  TriangleAreaCalculator
//
//  Created by Viraj Lakshitha Bandara on 2023-03-17.
//

import SwiftUI

struct HistoryView: View {
    @AppStorage("altitude") var altitude: String = ""
    @AppStorage("base") var base: String = ""
    @AppStorage("hypotenuse") var hypotenuse: String = ""
    @AppStorage("area") var area: String = ""
    @AppStorage("perimeter") var perimeter: String = ""
    
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
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
