//
//  Constants.swift
//  RainyShinyCloudy
//
//  Created by Gabriel T on 2017-09-18.
//  Copyright © 2017 Gabriel T. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "0b8e310a4d4ae41a0cd86942cf39abb5"
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=\(API_KEY)"

func roundDouble(number: Double) -> Double {
    return round(10 * number) / 10
}

typealias DownloadComplete = () -> ()
typealias ForecastsDownloadComplete = ([Forecast]) -> ()

