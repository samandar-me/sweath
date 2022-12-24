//
//  Models.swift
//  iosmvvm
//
//  Created by Macbook on 29.05.1444 (AH).
//

import Foundation

struct WeatherModel: Codable {
    let timezone: String
    let current: CurrentWeather
}

struct CurrentWeather: Codable {
    let temp: Float
    let weather: [WeatherInfo]
}
struct WeatherInfo: Codable {
    let main: String
    let description: String
}
