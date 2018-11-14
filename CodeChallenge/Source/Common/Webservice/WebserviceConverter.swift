//
//  WebserviceConverter.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import Foundation

class WebserviceConverter {
    var dataDict = Dictionary<String, Any>()
    
    convenience init(_ dictionary : Dictionary<String, Any>) {
        self.init()
        dataDict = dictionary
    }
    
    func stringWithKey(_ key : String) -> String {
        var value = ""
        if let nonNilData = dataDict[key] {
            if let x = nonNilData as? String {
                value = x
            }
        }
        return value
    }
    
    func dateWithKey(_ key : String) -> Date {
        var value : Date = Date()
        if let nonNilData = dataDict[key] {
            if let x = nonNilData as? Date {
                value = x
            }
        }
        return value
    }
    
    func intWithKey(_ key : String) -> Int {
        var value : Int = 0
        if let nonNilData = dataDict[key] {
            if let x = nonNilData as? Int {
                value = x
            }
        }
        return value
    }
    
    func doubleWithKey(_ key : String) -> Double {
        var value : Double = 0.00
        if let nonNilData = dataDict[key] {
            if let x = nonNilData as? Double {
                value = x
            }
        }
        return value
    }
    
    func decimalWithKey(_ key: String) -> Decimal {
        var value : Decimal = 0.00
        if let nonNilData = dataDict[key] {
            if let x = nonNilData as? Double {
                value = Decimal.init(x)
            }
        }
        return value
    }
    
    func floatWithKey(_ key: String) -> Float {
        var value : Float = 0.00
        if let nonNilData = dataDict[key] {
            if let x = nonNilData as? Float {
                value = x
            }
        }
        return value
    }
}
