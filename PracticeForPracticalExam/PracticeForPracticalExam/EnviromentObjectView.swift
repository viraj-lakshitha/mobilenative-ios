//
//  EnviromentObjectView.swift
//  PracticeForPracticalExam
//
//  Created by Viraj Lakshitha Bandara on 2023-03-02.
//

import SwiftUI

class EnviromentViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iWatch", "iMac"] )
    }
}

struct Rectangle {
    var width: Int = 10
    var height: Int = 4
    
    func getArea() -> Int {
        return width * height
    }
    
    // Since this function making changes to the rectangle properties - You have to make the function mutating.
    // This only happen in struct not in class. Because class are making references, but struct are using pointers. Also object declaration should be 'var' in struct but not in class
    mutating func scaleUp(value: Int) {
        width *= value
        height *= value
    }
    
}

struct EnviromentObjectView: View {
    
    // Create an instance of EnviromentViewModel
    @StateObject var viewModel: EnviromentViewModel = EnviromentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(destination: DetailView(selectedItem: item), label: {
                        Text(item).font(.headline)
                    })
                }
            }
            .navigationTitle("Apple Devices")
        }
        .environmentObject(viewModel) // This will allow access to all the sub view/components to the viewModel
    }
}

struct DetailView: View {
    let selectedItem: String
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            NavigationLink(destination: ThirdView(), label: {
                Text(selectedItem)
                    .padding()
                    .font(.title)
                    .foregroundColor(.red)
                    .bold()
                    .background(Color.white)
                    .cornerRadius(30)
                }
            )
        }
    }
}

struct ThirdView: View {
    @EnvironmentObject var viewModel: EnviromentViewModel
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self, content: { item in
                        Text(item)
                            .font(.headline)
                            .fontWeight(.semibold)
                    })
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
    }
}

struct EnviromentObjectView_Previews: PreviewProvider {
    static var previews: some View {
        EnviromentObjectView()
    }
}
