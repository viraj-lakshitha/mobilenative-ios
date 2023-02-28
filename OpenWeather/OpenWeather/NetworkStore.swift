//
//  NetworkStore.swift
//  OpenWeather
//
//  Created by Viraj Lakshitha Bandara on 2023-02-17.
//

import Foundation

class NetworkStore: ObservableObject {
        
    @Published var weatherData: WeatherDataModel?
    
    private var baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(APIConstants.KEY)&units=metric"
        
    func fetchData(city: String) async {
        // Sample URL - https://api.openweathermap.org/data/2.5/weather?appid=3f3546f76e8da2d07a248add62cedb3c&units=metric&q=colombo
        let urlString = "\(baseURL)&q=\(city)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        print("Loggin: Embedding urlString to URL")
        
        // URL
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        print("Loggin: Start making API request")
        
        // URL Session
        do {
            // Make the API request
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode JSON to WeatherDTO
            let decodeData = try JSONDecoder().decode(WeatherDTO.self, from: data)
            
            DispatchQueue.main.async {
                self.weatherData = WeatherDataModel(
                    name: decodeData.name,
                    description: decodeData.weather[0].description.capitalized,
                    temp: decodeData.main.temp,
                    pressure: decodeData.main.pressure,
                    humidity: decodeData.main.humidity,
                    feelsLike: decodeData.main.feelsLike,
                    visibility: decodeData.visibility,
                    windSpeed: decodeData.wind.speed,
                    cloudPrecentage: decodeData.clouds.all
                )
            }
            print("Complete fetching data")
        } catch {
            print("Error occur in fetching data")
        }
    }
}
