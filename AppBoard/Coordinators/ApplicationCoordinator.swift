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
        self.window = window

        self.boardsCoordinator = BoardsCoordinator(presenter: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        boardsCoordinator.start()
        window.makeKeyAndVisible()
    }
}