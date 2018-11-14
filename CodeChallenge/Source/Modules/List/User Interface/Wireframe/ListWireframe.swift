//
//  ListWireframe.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import UIKit

let listViewIdentifier = "ListView"

class ListWireframe: BaseWireframe {
    var listView: ListView?
    var rootWireframe: RootWireframe?
    var detailWireframe: DetailWireframe?
    var listPresenter: ListPresenter?
    var window: UIWindow?
    
    func presentLoginViewInterfaceFromWindow(Window window : UIWindow) {
        self.window = window
        let viewcontroller = mainStoryBoard().instantiateViewController(withIdentifier: listViewIdentifier) as! ListView
        viewcontroller.eventHandler = listPresenter
        listView = viewcontroller
        listPresenter?.view = viewcontroller
        rootWireframe?.showRootViewController(rootViewController: viewcontroller, inWindow: window)
    }
    
    func presentDetailViewByIndex(_ index: Int) {
        detailWireframe?.presentProductDetailViewFromViewController(listView!, productIndex: index)
    }
    
    func ListViewController() -> ListView {
        let viewcontroller = mainStoryBoard().instantiateViewController(withIdentifier: listViewIdentifier) as! ListView
        return viewcontroller
    }
}
