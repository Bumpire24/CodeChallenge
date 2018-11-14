//
//  DetailWireframe.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import UIKit

let detailViewIdentifier = "DetailView"

class DetailWireframe: BaseWireframe {
    var view : DetailView?
    var presenter : DetailPresenter?
    
    func presentProductDetailViewFromViewController(_ viewController: UIViewController, productIndex: Int) {
        let newViewController = detailViewController()
        view = newViewController
        view?.eventHandler = presenter
        presenter?.view = newViewController
        viewController.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    private func detailViewController() -> DetailView {
        let viewcontroller = mainStoryBoard().instantiateViewController(withIdentifier: detailViewIdentifier) as! DetailView
        return viewcontroller
    }
}
