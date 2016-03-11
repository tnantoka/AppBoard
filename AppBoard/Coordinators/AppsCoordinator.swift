//
//  AppsCoordinator.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/12/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit

class AppsCoordinator: Coordinator {
    
    let presenter: UINavigationController
    
    private let listViewController: TableViewController<App>
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        
        let configuration = Configuration<App>(
            cellStyle: .Default,
            configureCell: { cell, app in
                cell.textLabel?.text = app.name
            },
            selectItem: { app in
                print(app)
            },
            addItem: { tableView, dataSource in
                let app = App()
                app.name = "taatt"
                App.addNewItem(app)
                dataSource.insertTopRowIn(tableView)
            }
        )
        self.listViewController = TableViewController(configuration: configuration)
    }
    
    func start() {
        presenter.pushViewController(listViewController, animated: true)
    }
}