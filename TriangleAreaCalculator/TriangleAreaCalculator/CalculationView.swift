//
//  CalculationView.swift
//  TriangleAreaCalculator
//
//  Created by Viraj Lakshitha Bandara on 2023-03-17.
//

import SwiftUI

enum UnknowEdge: String {
    case Altitude, Base, Hypotenuse
}

struct CalculationView: View {
    
    @AppStorage("altitude") var altitudeHistory: String = ""
    @AppStorage("base") var baseHistory: String = ""
    @AppStorage("hypotenuse") var hypotenuseHistory: String = ""
    @AppStorage("perimeter") var perimeterHistory: String = ""
    @AppStorage("area") var areaHistory: String = ""
    
    @State var altitude: String = ""
    @State var base: String = ""
    @State var hypotenuse: String = ""
    @State var perimeter: String = ""
    @State var area: String = ""
    
    @State var calculatedEdge: String = ""
    @State var unknowEdge: UnknowEdge = .Altitude
    
    init() {
        altitude = altitudeHistory
        base = baseHistory
        hypotenuse = hypotenuseHistory
        perimeter = perimeterHistory
        area = areaHistory
    }
    
    func didPickerUpdate() -> [UnknowEdge] {
        switch unknowEdge {
        case .Altitude:
            return [UnknowEdge.Base, UnknowEdge.Hypotenuse]
        case .Base:
            return [UnknowEdge.Altitude, UnknowEdge.Hypotenuse]
        default:
            return [UnknowEdge.Base, UnknowEdge.Altitude]
        }
    }
    
    func setValuesToHistory(altitude: String, base: String, hypotenuse: String, area: String, perimeter: String) {
        altitudeHistory = altitude
        baseHistory = base
        hypotenuseHistory = hypotenuse
        perimeterHistory = perimeter
        areaHistory = area
    }
    
    func calcualteValue() {
        switch unknowEdge {
        case .Altitude:
            if let side1 = Double(base), let side2 = Double(hypotenuse) {
                // altitude
                let unknowEdgeValue = sqrt(pow(side2, 2) - pow(side1, 2))
                area = String(format: "%.2f", calculateArea(altitudeValue: unknowEdgeValue, baseValue: side1))
                perimeter = String(format: "%.2f", calculatePerimeter(altitudeValue: unknowEdgeValue, baseValue: side1))
                calculatedEdge = String(format: "%.2f", unknowEdgeValue)
                altitude = String(format: "%.2f", unknowEdgeValue)
            }
        case .Hypotenuse:
            if let side1 = Double(altitude), let side2 = Double(base) {
                // hypotenuse
                let unknowEdgeValue = sqrt(pow(side1, 2) + pow(side2, 2))
                area = String(format: "%.2f", calculateArea(altitudeValue: side1, baseValue: side2))
                perimeter = String(format: "%.2f", calculatePerimeter(altitudeValue: side1, baseValue: side2))
                calculatedEdge = String(format: "%.2f", unknowEdgeValue)
                hypotenuse = String(format: "%.2f", unknowEdgeValue)
            }
        default:
            if let side1 = Double(hypotenuse), let side2 = Double(altitude) {
                // base
                let unknowEdgeValue = sqrt(pow(side1, 2) - pow(side2, 2))
                area = String(format: "%.2f", calculateArea(altitudeValue: side2, baseValue: unknowEdgeValue))
                perimeter = String(format: "%.2f", calculatePerimeter(altitudeValue: side2, baseValue: unknowEdgeValue))
                calculatedEdge = String(format: "%.2f", unknowEdgeValue)
                base = String(format: "%.2f", unknowEdgeValue)
            }
        }
        setValuesToHistory(altitude: altitude, base: base, hypotenuse: hypotenuse, area: area, perimeter: perimeter)
    }
    
    func calculateArea(altitudeValue: Double, baseValue: Double) -> Double {
        return altitudeValue + baseValue + sqrt(pow(altitudeValue, 2) + pow(baseValue, 2))
    }
    
    func calculatePerimeter(altitudeValue: Double, baseValue: Double) -> Double {
        return (altitudeValue * baseValue) / 2
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                Image("right_triangle")
                HStack {
                    Text("Choose the unknow edge").bold()
                    Picker("Select Unknow Edge", selection: $unknowEdge) {
                        Text("\(UnknowEdge.Altitude.rawValue)")
                            .tag(UnknowEdge.Altitude)
                        
                        Text("\(UnknowEdge.Base.rawValue)")
                            .tag(UnknowEdge.Base)
                        
                        Text("\(UnknowEdge.Hypotenuse.rawValue)")
                            .tag(UnknowEdge.Hypotenuse)
                    }
                    .pickerStyle(.wheel)
                    .onChange(of: unknowEdge, perform: { _ in
                        area = ""
                        perimeter = ""
                        altitude = ""
                        hypotenuse = ""
                        base = ""
                    })
                }
                
                VStack(alignment: .leading) {
                    Text("Enter know value length")
                        .bold()
                    if unknowEdge.rawValue != UnknowEdge.Altitude.rawValue {
                        TextField("\(UnknowEdge.Altitude.rawValue) Value", text: $altitude)
                            .textFieldStyle(.roundedBorder)
                    }

                    if unknowEdge.rawValue != UnknowEdge.Hypotenuse.rawValue {
                        TextField("\(UnknowEdge.Hypotenuse.rawValue) Value", text: $hypotenuse)
                            .textFieldStyle(.roundedBorder)
                    }

                    if unknowEdge.rawValue != UnknowEdge.Base.rawValue {
                        TextField("\(UnknowEdge.Base.rawValue) Value", text: $base)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                .padding(.bottom)

                Button("Calculate") {
                    calcualteValue()
                }
                .padding()
                .background(.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                if !(area.isEmpty && perimeter.isEmpty) {
                    VStack {
                        HStack {
                            Text("\(unknowEdge.rawValue):")
                            Spacer()
                            Text("\(calculatedEdge)")
                        }
                        .padding(.bottom)
                        
                        HStack {
                            Text("Perimeter:")
                            Spacer()
                            Text("\(perimeter)")
                        }
                        .padding(.bottom)
                        
                        HStack {
                            Text("Area:")
                            Spacer()
                            Text("\(area)")
                        }
                        .padding(.bottom)
                    }
                    .padding()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationTitle("Triangle Calculator")
        }
    }
}

struct CalculationView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationView()
    }
}
