//
//  DetailPresenter.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import UIKit

class DetailPresenter: NSObject, DetailInteractorOutput, DetailModuleProtocol {
    var view: DetailViewProtocol?
    var interactor: DetailInteractorInput?
    
    func gotPlaceByIndex(_ place: Place) {
        view?.displayPlaceDetail(place)
    }
    
    func getPlaceDetails() {
        interactor?.fetchPlaceByIndex()
    }
}
