//
//  ContentView.swift
//  MockExam
//
//  Created by Viraj Lakshitha Bandara on 2023-02-24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("first_term") var firstTerm: String = "15"
    @AppStorage("second_term") var secondTerm: String = "120"
    @AppStorage("third_term") var thirdTerm: String = "10"
    @AppStorage("answer") var answer: String = ""
    
    func solveForX() {
        if let aWrap = Double(firstTerm), let bWrap = Double(secondTerm), let cWrap = Double(thirdTerm) {
            if (aWrap == 0.0) {
                answer = "Unable to calculate"
            } else {
                let x1 = (-bWrap + sqrt(Double(pow(bWrap, 2) - 4*aWrap*cWrap))) / 2*aWrap
                let x2 = (-bWrap - sqrt(Double(pow(bWrap, 2) - 4*aWrap*cWrap))) / 2*aWrap
                if x1.isNaN || x2.isNaN {
                    answer = "Unable to calculate"
                } else {
                    answer = "+x: \(String(format: "%.2f", x1)), -x: \(String(format: "%.2f", x2))"
                }
            }
        } else {
            answer = "Unable to unwrap values"
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("Quadratic Solver").font(.largeTitle).bold()
                
                Image("quadraticForm")
                            .resizable()
                            .scaledToFit()
                
                VStack {
                    Label("Enter first term", systemImage: "a.circle.fill").font(.title)
                    TextField("First term here", text: $firstTerm)
                        .multilineTextAlignment(.center)
                        .padding(.all)
                        .border(Color.black, width: 3)
                }.padding()
                
                VStack {
                    Label("Enter second term", systemImage: "b.circle.fill").font(.title)
                    TextField("Second term here", text: $secondTerm)
                        .multilineTextAlignment(.center)
                        .padding(.all)
                        .border(Color.black, width: 3)
                }.padding()
                
                VStack {
                    Label("Enter third term", systemImage: "c.circle.fill").font(.title)
                    TextField("Third term here", text: $thirdTerm)
                        .multilineTextAlignment(.center)
                        .padding(.all)
                        .border(Color.black, width: 3)
                }.padding()
                
                VStack {
                    Button("Solve for X", action: solveForX)
                    Text(answer).padding().font(.title3)
                }.padding()
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
