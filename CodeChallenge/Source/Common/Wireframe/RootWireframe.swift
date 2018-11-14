//
//  RootWireframe.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import UIKit

class RootWireframe: NSObject {

    func showRootViewController (rootViewController viewcontroller : UIViewController, inWindow window : UIWindow) {
        let navigationController = navigationControllerfromWindow(window)
        navigationController.viewControllers = [viewcontroller]
    }
    
    func navigationControllerfromWindow (_ window : UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        return navigationController
    }
    
}
