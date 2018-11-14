//
//  ListInteractorIO.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import Foundation

protocol ListInteractorInput {
    func retrievePlaces()
    func setSelectedIndex(byIndex index: Int)
}

protocol ListInteractorOutput {
    func retrievePlacesComplete(wasSuccessful isSuccess: Bool, withMessage message: String, withPlaces places: [Place])
}
