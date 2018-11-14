//
//  Place.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import Foundation

struct Place {
    var name: String = ""
    var distance: Int = 0
    var address: String = ""
}

extension Place {
    init(placeName: String, placeDistance: Int, placeAddress: String) {
        self.name = placeName
        self.distance = placeDistance
        self.address = placeAddress
    }
    
    init(dictionary dataDict: [String: Any]) {
        let wsConverter = WebserviceConverter.init(dataDict)
        self.name = wsConverter.stringWithKey("name")
        if let locationDict = dataDict["location"] as? [String: Any] {
            let wsConverter = WebserviceConverter.init(locationDict)
            self.address = wsConverter.stringWithKey("address")
            self.distance = wsConverter.intWithKey("distance")
        }
    }
}
