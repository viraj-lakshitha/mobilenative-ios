//
//  SearchView.swift
//  OpenWeather
//
//  Created by Viraj Lakshitha Bandara on 2023-02-17.
//

import SwiftUI
   
struct SearchView: View {
    @StateObject var manager = NetworkStore()
    @State var searchValue: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Weather")
                .font(.largeTitle).bold()
            
            HStack {
                TextField("Colombo", text: $searchValue)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    // Call the API according to the text field input
                    Task { // This is because, the calling this method is an async task
                        await manager.fetchData(city:searchValue)
                    }
                } label: {
                    Text("Search")
                }
            }
            
//            if let data = manager.weatherData {
//                ScrollView {
//                    LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.width*0.4))]) {
//                        StatView(imageName: "aqi.low", statTitle: data.description, statValue: "Current Status")
//                        StatView(imageName: "thermometer.low", statTitle: "\(data.temp) ℃", statValue: "Temperature")
//                        StatView(imageName: "humidity", statTitle: String(data.humidity), statValue: "Humidity")
//                        StatView(imageName: "tornado", statTitle: String(data.pressure), statValue: "Pressure")
//                        StatView(imageName: "sun.and.horizon.fill", statTitle: String(data.visibility), statValue: "Visibility")
//                        StatView(imageName: "wind", statTitle: String(data.windSpeed), statValue: "Wind Speed")
//                        StatView(imageName: "cloud.fill", statTitle: String(data.cloudPrecentage), statValue: "Clouds (%)")
//                    }
//                }
//            }
            
            if let data = manager.weatherData {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.width*0.4))]) {
                        ForEach(buildStats(data: data), id: \.id) { stat in
                            StatView(imageName: stat.icon, statTitle: stat.value, statValue: stat.description)
                        }
                    }
                }
            }
        }.padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct StatView: View {
    var imageName: String = ""
    var statTitle: String = ""
    var statValue: String = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: UIScreen.main.bounds.width*0.45, // get half of the screen
                       height: 200)
                .foregroundColor(.gray)
                .opacity(0.4)
            
            VStack(spacing: 10) {
                Image(systemName: imageName).font(.system(size: 50))
                Text(statTitle).font(.system(size: 20)).bold()
                Text(statValue).font(.system(size: 15))
            }
        }
    }
}
