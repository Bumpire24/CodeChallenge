//
//  BaseWireframe.swift
//  CodeChallenge
//
//  Created by Miguel Fontamillas on 14/11/2018.
//  Copyright © 2018 Miguel Fontamillas. All rights reserved.
//

import UIKit

class BaseWireframe: NSObject {
    func mainStoryBoard() -> UIStoryboard {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        return storyBoard
    }
}
