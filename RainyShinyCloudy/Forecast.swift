//
//  Forecast.swift
//  RainyShinyCloudy
//
//  Created by Gabriel T on 2017-09-18.
//  Copyright © 2017 Gabriel T. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    init() {
        return
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["main"] as? Dictionary<String, AnyObject> {
            if let max = temp["temp"] as? Double {
                let kelvinToCelsius = (max - 273.15)
                self._highTemp = "\(roundDouble(number: kelvinToCelsius))"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            self._date = "\(unixConvertedDate.dayOfTheWeek()), \(unixConvertedDate.getHour())"
        }
    }
    
    static func downloadForecastData(completed: @escaping ForecastsDownloadComplete) {
        // Downloading forecast weather data for TableView
        let forecastURL = URL(string: FORECAST_URL)!
        var forecasts = [Forecast]()
        
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        forecasts.append(forecast)
                    }
                }
            }
            completed(forecasts)
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
    func getHour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h a"
        return dateFormatter.string(from: self)
    }
}
