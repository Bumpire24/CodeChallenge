//
//  AppDependencies.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import UIKit

class AppDependencies: NSObject {
    private var mainWireframe: ListWireframe?
    
    override init() {
        super.init()
        configureDependencies()
    }
    
    func installRootViewController(InWindow window : UIWindow) {
        mainWireframe?.presentLoginViewInterfaceFromWindow(Window: window)
    }
    
    func configureDependencies() {
        let root = RootWireframe()
        let webservice = Webservice()
        
        // List
        let listWireframe = ListWireframe()
        let listPresenter = ListPresenter()
        let listInteractor = ListInteractor()
        
        listWireframe.rootWireframe = root
        listWireframe.listPresenter = listPresenter
        mainWireframe = listWireframe
        
        listPresenter.listWireframe = listWireframe
        listPresenter.interactor = listInteractor
        
        listInteractor.webService = webservice
        listInteractor.output = listPresenter
        
        // Detail
        let detailWireframe = DetailWireframe()
        let detailPresenter = DetailPresenter()
        
        listWireframe.detailWireframe = detailWireframe
        detailWireframe.presenter = detailPresenter
        
        detailPresenter.interactor = listInteractor
        
        listInteractor.outputDetail = detailPresenter
    }
}
