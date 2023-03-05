//
//  AppStorageDemo.swift
//  PracticeForPracticalExam
//
//  Created by Viraj Lakshitha Bandara on 2023-03-02.
//

import SwiftUI

struct AppStorageView: View {
    // In @AppStorage, you don't need to get or set values, it just do it by it self. But in UserDefault, you have set an get it seperately.
    
//    let nameKey: String = "name"
//    @State var currentUsername: String?
    @AppStorage("name") var currentUsername: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUsername ?? "Add Username?")
                .font(.headline)
            
            if let name = currentUsername {
                Text(name)
                    .font(.headline)
            }
            Button("Save".uppercased()) {
                let name = "Viraj"
                currentUsername = name
//                UserDefaults.standard.set(name, forKey: nameKey)
            }
        }
//        .onAppear {
//            currentUsername = UserDefaults.standard.string(forKey: nameKey)
//        }
    }
}

struct AppStorageView_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageView()
    }
}
