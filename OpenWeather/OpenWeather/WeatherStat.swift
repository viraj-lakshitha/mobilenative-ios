//
//  WeatherStat.swift
//  OpenWeather
//
//  Created by Viraj Lakshitha Bandara on 2023-02-24.
//

import Foundation

struct Stat {
    let id: Int
    let icon: String
    let value: String
    let description: String
}

func buildStats(data: WeatherDataModel) -> [Stat] {
    var stats: [Stat] = []
    stats.append(
        Stat(id: 0, icon: "aqi.low", value: data.description, description: "Current Status")
    )
    stats.append(
        Stat(id: 1, icon: "thermometer.low", value: "\(data.temp) ℃", description: "Temperature")
    )
    stats.append(
        Stat(id: 2, icon: "humidity", value: String(data.humidity), description: "Humidity")
    )
    stats.append(
        Stat(id: 3, icon: "tornado", value: String(data.pressure), description: "Pressure")
    )
    stats.append(
        Stat(id: 4, icon: "sun.and.horizon.fill", value: String(data.visibility), description: "Visibility")
    )
    stats.append(
        Stat(id: 5, icon: "wind", value: String(data.windSpeed), description: "Wind Speed")
    )
    stats.append(
        Stat(id: 6, icon: "cloud.fill", value: String(data.cloudPrecentage), description: "Clouds (%)")
    )
    return stats
}
