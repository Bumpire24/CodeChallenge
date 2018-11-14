//
//  DetailInteractorIO.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import Foundation

protocol DetailInteractorInput {
    func fetchPlaceByIndex()
}

protocol DetailInteractorOutput {
    func gotPlaceByIndex(_ place: Place)
}
