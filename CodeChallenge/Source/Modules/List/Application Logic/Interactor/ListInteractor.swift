//
//  ListInteractor.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import Foundation

class ListInteractor: NSObject, ListInteractorInput, DetailInteractorInput {
    var webService: Webservice?
    var output: ListInteractorOutput?
    var outputDetail: DetailInteractorOutput?
    private var persistedList: [Place]?
    private var selectedList: Int?
    
    func retrievePlaces() {
        if let persistedList = persistedList {
            self.output?.retrievePlacesComplete(wasSuccessful: true, withMessage: "", withPlaces: persistedList)
        } else {
            self.persistedList = [Place]()
            webService?.callWebservice(block: { response in
                switch response {
                case .success(let value):
                    if let nonNilValue = value {
                        for (venue) in nonNilValue {
                            if let venueDataDict = venue as? [String: Any] {
                                self.persistedList?.append(Place.init(dictionary: venueDataDict))
                            }
                        }
                        self.output?.retrievePlacesComplete(wasSuccessful: true, withMessage: "Fetch Success", withPlaces: self.persistedList!)
                    }
                case .failure(_): break
                }
            })
        }
    }
    
    func fetchPlaceByIndex() {
        if let persistedList = persistedList, let index = selectedList {
            outputDetail?.gotPlaceByIndex(persistedList[index])
        }
    }
    
    func setSelectedIndex(byIndex index: Int) {
        selectedList = index
    }
}
