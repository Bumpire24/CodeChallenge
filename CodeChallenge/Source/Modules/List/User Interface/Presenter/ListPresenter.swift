//
//  ListPresenter.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import UIKit

class ListPresenter: NSObject, ListModuleProtocol, ListInteractorOutput {
    var view: ListViewProtocol?
    var interactor: ListInteractorInput?
    var listWireframe: ListWireframe?
    
    func fetchList() {
        interactor?.retrievePlaces()
    }
    
    func goToDetail(atIndex index: Int) {
        interactor?.setSelectedIndex(byIndex: index)
        listWireframe?.presentDetailViewByIndex(index)
    }
    
    func retrievePlacesComplete(wasSuccessful isSuccess: Bool, withMessage message: String, withPlaces places: [Place]) {
        view?.displayList(places)
    }
}
