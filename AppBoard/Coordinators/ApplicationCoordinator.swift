//
//  ApplicationCoordinator.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/10/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit

struct ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController = UINavigationController()
    
    let boardsCoordinator: BoardsCoordinator
    
    init(window: UIWindow) {
        ApplicationCoordinator.setAppearance()
        self.window = window
        self.boardsCoordinator = BoardsCoordinator(presenter: rootViewController)
    }

    static func setAppearance() {
        UINavigationBar.appearance().tintColor = UIColor(red: 233.0 / 255.0, green: 30.0 / 255.0, blue: 99.0 / 255.0, alpha: 1.0) // #e91e63
    }
    
    func start() {
        window.rootViewController = rootViewController
        boardsCoordinator.start()
        window.makeKeyAndVisible()
    }
}