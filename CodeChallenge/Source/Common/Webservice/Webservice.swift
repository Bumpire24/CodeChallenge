//
//  Webservice.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import Foundation

class Webservice {
    let fourSquareID = "ME4C0MNVTAPQJQF2IRNZ3MUXGEDQT4EP5Y3YBVWQMQJYO2ZJ"
    let fourSquareSecret = "UJEEAJFF5IN4KWINXEMGL12OLPLMTGKTF3ZRTIF5TV42X4D4"
    let fourSquareVersion = "20180323"
    let fourSquareBaseURL = "https://api.foursquare.com"
    let fourSquareTestLocation = "14.584415,121.059912"
    
    func callWebservice(block: @escaping CompletionBlock<[Any]>) {
        var urlString = fourSquareBaseURL + "/v2/venues/search?"
        let fourSquareParameterDict = ["client_id": fourSquareID,
                                       "client_secret": fourSquareSecret,
                                       "ll": fourSquareTestLocation,
                                       "v": fourSquareVersion]
        for (key, value) in fourSquareParameterDict {
            urlString += "&" + key + "=" + value
        }
        
        let url = URL(string: urlString)
        if let usableUrl = url {
            let request = URLRequest(url: usableUrl)
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let error = error {
                    block(.failure(error))
                } else {
                    if let data = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                            if let jsonresponse = json["response"] as? [String: Any] {
                                if let venues = jsonresponse["venues"] as? [Any] {
                                    block(.success(venues))
                                }
                            }
                        } catch let error as NSError {
                            block(.failure(error))
                        }
                    } else {
                        block(.failure(nil))
                    }
                }
            })
            task.resume()
        }
    }
}
