//
//  ContentView.swift
//  DistanceConverter
//
//  Created by Viraj Lakshitha Bandara on 2023-03-15.
//

import SwiftUI

enum Units {
    case ft
    case cm
    case yd
    case km
}

struct ContentView: View {
    
    @State var distanceInMeters: String = ""
    @State var calculateValue: String = "-"
    @State var calculateUnit: String = "-"
    
    func didCalculateValue(unit: Units) {
        if let userInput = Double(distanceInMeters) {
            switch unit {
            case .ft:
                calculateUnit = "Ft"
                calculateValue = String(userInput * 3.28)
                return
            case .cm:
                calculateUnit = "cm"
                calculateValue = String(userInput * 1.09)
                return
            case .km:
                calculateUnit = "km"
                calculateValue = String(userInput * 0.001)
                return
            default:
                calculateUnit = "Yd"
                calculateValue = String(userInput * 100)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 150) {
            // Upper part
            VStack() {
                Text("Distance Converter")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Unit in meters", text: $distanceInMeters)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .frame(height: 60)
                    .border(Color.black, width: 5)
                    .padding(.horizontal, 10)
                
                HStack() {
                    Button(action: {
                        didCalculateValue(unit: .ft)
                    }) {
                        Text("Ft")
                            .padding()
                    }
                    .frame(minWidth: 80).background(Color.red).foregroundColor(.white)
                    
                    Button(action: {
                        didCalculateValue(unit: .cm)
                    }) {
                        Text("cm")
                            .padding()
                    }
                    .frame(minWidth: 80).background(Color.green).foregroundColor(.white)
                    
                    Button(action: {
                        didCalculateValue(unit: .yd)
                    }) {
                        Text("Yd")
                            .padding()
                    }
                    .frame(minWidth: 80).background(Color.blue).foregroundColor(.white)
                    
                    Button(action: {
                        didCalculateValue(unit: .km)
                    }) {
                        Text("km")
                            .padding()
                    }
                    .frame(minWidth: 80).background(Color.black).foregroundColor(.white)
                }
                .padding()
                
                if distanceInMeters != "" {
                    Text("The distnace in \(calculateUnit) is \(calculateValue)")
                        .font(.title3)
                        .bold()
                }
                
                Image("calc_img")
                    .resizable()
                    .frame(width: 300, height: 200)
            }
            .padding()
            
            // Later part
            VStack {
                Button(action: {
                    
                }) {
                    Text("Reset")
                        .padding()
                }
                .frame(minWidth: 80).background(Color.gray).foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
