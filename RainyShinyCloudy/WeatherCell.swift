//
//  WeatherCell.swift
//  RainyShinyCloudy
//
//  Created by Gabriel T on 2017-09-18.
//  Copyright © 2017 Gabriel T. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    
    func configureCell(forecast: Forecast) {
        highTemp.text = forecast.highTemp + "°"
        weatherType.text = forecast.weatherType
        dayLabel.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }
}
