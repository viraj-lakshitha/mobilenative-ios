//
//  ContentView.swift
//  LectureRecap-2
//
//  Created by Viraj Lakshitha Bandara on 2023-03-04.
//

import SwiftUI

struct Tutorial1: View {
    @State var weightInput: String = ""
    @State var heightInput: String = ""
    @State var bmiValue: String = ""
    
    var body: some View {
        ZStack {
            // Add full screen background color - This only work in ZStack
            Color.green.ignoresSafeArea()
            
            VStack {
                Text("BMI Calculator")
                    .font(.title)
                    .bold()
                
                VStack {
                    TextField("Enter Weight (in kg)", text: $weightInput)
                        .textFieldStyle(.roundedBorder)
                        .border(Color.black)
                    
                    TextField("Enter Height (in cm)", text: $heightInput)
                        .textFieldStyle(.roundedBorder)
                        .border(Color.black)
                }.padding(.bottom)
                
                Button {
                    var weight: Double = 0
                    var height: Double = 0
                    
                    if let weightDouble = Double(weightInput), let heightDouble = Double(heightInput) {
                        weight = weightDouble
                        height = heightDouble
                        self.bmiValue = String(format: "%.2f" ,weight / (height*height))
                    } else {
                        self.bmiValue = "Unable to Calculate"
                    }
                } label: {
                    Text("Calculate BMI")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                }
                
                Text(bmiValue)
                    .padding()
                    .font(.title2)
                    .bold()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial1()
    }
}
