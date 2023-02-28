//
//  HomeView.swift
//  OpenWeather
//
//  Created by Viraj Lakshitha Bandara on 2023-02-17.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var networkStore = NetworkStore()
    
    var body: some View {
        VStack(spacing: 20) {
            if let weatherData = networkStore.weatherData {
                Text("\(weatherData.name)").font(.title)
                Text("\(Date().formatted())")
                Text("\(weatherData.formattedTemp)℃").font(.system(size: 70)).bold()
                Text("\(weatherData.description)").font(.title)
            } else {
                ProgressView()
            }
        }
        .task {
            await networkStore.fetchData(city: "colombo")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
