//
//  ViewModel.swift
//  iosmvvm
//
//  Created by Macbook on 29.05.1444 (AH).
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var timeZone: String = ""
    @Published var temp: String = ""
    
    init() {
        getWeatherData()
    }
    
    func getWeatherData() {
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/onecall?lat=40.8154&lon=72.2837&exclude=hourly,daily,minutely&units=imperial&appid=6592d24a33ae13c2ac1401db99732c61") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,error == nil else {
                return
            }
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "No title"
                    self.description = model.current.weather.first?.description ?? "No description"
                    self.temp = "\(model.current.temp)°"
                    self.timeZone = model.timezone
                }
            } catch {
                print("Error occured")
            }
        }
        task.resume()
    }
}
