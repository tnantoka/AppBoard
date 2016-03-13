//
//  AppCoordinator.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/13/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit

struct AppCoordinator: Coordinator {
    
    let presenter: UINavigationController
    
    private let detailViewController: AppViewController
    
    init(presenter: UINavigationController, app: App) {
        self.presenter = presenter
        
        let storyboard = UIStoryboard(name: "AppViewController", bundle: nil)
        let appController = storyboard.instantiateInitialViewController() as! AppViewController
        appController.app = app
        self.detailViewController = appController
    }
    
    func start() {
        presenter.pushViewController(detailViewController, animated: true)
    }
}
