//
//  Location.swift
//  RainyShinyCloudy
//
//  Created by Gabriel T on 2017-09-19.
//  Copyright © 2017 Gabriel T. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
