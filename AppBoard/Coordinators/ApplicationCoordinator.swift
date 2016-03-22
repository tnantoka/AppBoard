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
        UILabel.appearance().textColor = UIColor(white: 0.0, alpha: 0.87)
        UITextView.appearance().textColor = UILabel.appearance().textColor
        
        UINavigationBar.appearance().tintColor = UIColor(red: 233.0 / 255.0, green: 30.0 / 255.0, blue: 99.0 / 255.0, alpha: 1.0) // #e91e63
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName: UILabel.appearance().textColor
        ]
    }
    
    func start() {
        window.rootViewController = rootViewController
        boardsCoordinator.start()
        window.makeKeyAndVisible()
    }
}