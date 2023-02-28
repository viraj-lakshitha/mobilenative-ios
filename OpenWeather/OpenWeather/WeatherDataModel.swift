//
//  WeatherDataModel.swift
//  OpenWeather
//
//  Created by Viraj Lakshitha Bandara on 2023-02-17.
//

import Foundation

struct WeatherDataModel {
    let name: String
    let description: String
    let temp: Double
    let pressure: Int
    let humidity: Int
    let feelsLike: Double
    let visibility: Int
    let windSpeed: Double
    let cloudPrecentage: Int
    
    // computed property
    var formattedTemp: String {
        return String(format: "%.1f", temp)
    }
}
