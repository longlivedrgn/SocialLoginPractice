//
//  OpenWeather.swift
//  KakaoLoginPractice
//
//  Created by Miro on 1/18/24.
//

import Foundation


struct CurrentWeatherDTO: Decodable {

    let temperature: TemperatureDTO
    let weather: [WeatherDTO]

    enum CodingKeys: String, CodingKey {
        case temperature = "main"
        case weather
    }

}

struct TemperatureDTO: Decodable {

    let averageTemperature, minimumTemperature, maximumTemperature: Double

    enum CodingKeys: String, CodingKey {
        case averageTemperature = "temp"
        case minimumTemperature = "temp_min"
        case maximumTemperature = "temp_max"
    }

}

struct WeatherDTO: Decodable {

    let id: Int
    let icon: String

}
