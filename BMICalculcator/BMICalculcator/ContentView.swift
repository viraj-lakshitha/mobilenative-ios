//
//  ContentView.swift
//  BMICalculcator
//
//  Created by Viraj Lakshitha Bandara on 2023-02-10.
//

import SwiftUI

struct ContentView: View {
    @State private var weightText: String = "50"
    @State private var heightText: String = "50"
    @State private var message: String = "0.0"
    @State private var showResult: Bool = false
    @State private var weightSlider: Float = 50.0
    @State private var heightSlider: Float = 50.0
    @State private var isEdit: Bool = false
    @State private var isAlertShow: Bool = false
        
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea().opacity(0.5)
            VStack {
                Text("BMI Calculator").font(.largeTitle).fontWeight(.bold)
                
                Slider(
                    value: $weightSlider,
                    in: 0...100,
                    onEditingChanged: {_ in
                        weightText = String(Int(weightSlider))
                    }
                )
                
                HStack {
                    Text("Weight")
                    TextField("Enter weight (kg)", text: $weightText)
                        .frame(height: 40)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(10)
                }
                
                Slider(
                    value: $heightSlider,
                    in: 0...100,
                    onEditingChanged: {_ in
                        heightText = String(Int(heightSlider))
                    }
                )
                
                HStack{
                    Text("Height")
                    TextField("Enter height (cm)", text: $heightText)
                        .frame(height: 40)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(10)
                }
                
                Button {
                    // Method 1 - Handle the exception in unwrap
                    if let weight = Double(weightText), let height = Double(heightText) {
                        let  bmi = weight / pow(height, 2)
                        message = "BMI Value \(String(bmi))" // Assign the calculated value to bmiValue
                        if bmi.isNaN || weight == 0.0 {
                            isAlertShow = true
                            message = ""
                        }
                        print("Weight: \(weight), Height: \(height), BMI: \(bmi)")
                    } else {
                        isAlertShow = true
                        print("Unable to unwrap the values!")
                    }
                    showResult = true
                    
                    // Method 2 - Handle the exception in unwrap
    //                guard let weight = Double(weightText), let height = Double(heightText) else {
    //                    print("Unable to unwrap the values!")
    //                    return
    //                }
    //                let  bmi = weight / pow(height, 2)
    //                print("Weight: \(weight), Height: \(height), BMI: \(bmi)")
                    
                }label: {
                    Text("Calculate BMI")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .frame(width: 200).padding(.top)
                .alert("Unable to calculate!", isPresented: $isAlertShow, actions: {
                    Button("OK", role: .cancel, action: {})
                })
                
                if showResult {
                    Text("\(message)").fontWeight(.semibold)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
