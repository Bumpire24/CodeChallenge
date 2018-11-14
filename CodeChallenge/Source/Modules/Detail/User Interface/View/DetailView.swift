//
//  DetailView.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import UIKit

class DetailView: UIViewController, DetailViewProtocol {
    @IBOutlet var detailView: UIView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeAddressTextView: UITextView!
    var eventHandler: DetailModuleProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventHandler?.getPlaceDetails()
    }
    
    func displayPlaceDetail(_ place: Place) {
        placeNameLabel.text = place.name
        placeAddressTextView.text = place.address
    }
}
