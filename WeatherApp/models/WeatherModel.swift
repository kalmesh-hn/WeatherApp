
//
//  WeatherModel.swift
//  WeatherApp
//
//  Copyright © 2020 Kalmesh. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct WeatherInfo: Codable {
    let latitude, longitude: Double
    let timezone: String
    let currently: Currently
}

// MARK: - Currently
struct Currently: Codable {
    let time: Double
    let temperature, apparentTemperature, dewPoint, humidity: Double
    let pressure, windSpeed, windGust: Double
    let cloudCover: Double
    let ozone: Double
    let visibility: Double
}
