//
//  ContentView.swift
//  QuadraticSolver
//
//  Created by Viraj Lakshitha Bandara on 2023-03-15.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("first_term") var firstTerm: String = ""
    @AppStorage("second_term") var secondTerm: String = ""
    @AppStorage("third_term") var thirdTerm: String = ""
    @AppStorage("result") var result: String = ""
    
    var body: some View {
        VStack {
            Text("Quadratic Solver")
                .font(.title)
                .padding()
            
            Text("The quadratic form is:")
            
            Image("quadratic_form")
                .resizable()
                .scaledToFit()
            
            VStack {
                HStack {
                    Image(systemName: "a.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("Enter the first term")
                        .font(.title2)
                }
                
                TextField("Enter the first term", text: $firstTerm)
                    .padding()
                    .border(.black, width: 3)
            }
            .padding()
            
            VStack {
                HStack {
                    Image(systemName: "b.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("Enter the second term")
                        .font(.title2)
                }
                
                TextField("Enter the second term", text: $secondTerm)
                    .padding()
                    .border(.black, width: 3)
            }
            .padding()
            
            VStack {
                HStack {
                    Image(systemName: "c.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("Enter the third term")
                        .font(.title2)
                }
                
                TextField("Enter the third term", text: $thirdTerm)
                    .padding()
                    .border(.black, width: 3)
            }
            .padding()
            
            Button("Solve for X") {
                calculateQuadratic()
            }
            .padding()
            
            if result != "" {
                Text("\(result)")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    func calculateQuadratic() {
        if let doubleA = Double(firstTerm), let doubleB = Double(secondTerm), let doubleC = Double(thirdTerm) {
            var core = sqrt(doubleB * doubleB) - 4 * doubleA * doubleC
            var positiveValue = (-doubleB + core) / 2 * doubleA
            var negativeValue = (-doubleB - core) / 2 * doubleA
            result = "+X = \(String(format: "%.2f", positiveValue)), -X = \(String(format: "%.2f", negativeValue))"
        } else {
            result = "Invalid arguments"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
