//
//  ErrorCoordinator.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/13/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit

struct ErrorCoordinator: Coordinator {
    let presenter: UINavigationController
    let error: String
    
    init(presenter: UINavigationController, error: String) {
        self.presenter = presenter
        self.error = error
    }
    
    func start() {
        let alertController = UIAlertController(
            title: NSLocalizedString("Error", comment: ""),
            message: error,
            preferredStyle: .Alert
        )
        alertController.addAction(
            UIAlertAction(
                title: NSLocalizedString("OK", comment: ""),
                style: .Default,
                handler: nil
            )
        )
        presenter.presentViewController(alertController, animated: true, completion: nil)
    }
}