//
//  BoardsCoordinator.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/10/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit

class BoardsCoordinator: Coordinator {
    
    let presenter: UINavigationController
    
    private let listViewController: TableViewController<Account>
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        
        let account = Account()
        let configuration = Configuration(
            dataObject: account,
            cellStyle: .Default,
            editable: true,
            configureCell: { cell, board in
                cell.textLabel?.text = board.name
            },
            selectItem: { board in
                let appsCoordinator = AppsCoordinator(presenter: presenter, board: board)
                appsCoordinator.start()
            },
            addItem: { tableView, dataSource in
                let board = Board()
                board.name = "taatt"
                account.addNewItem(board)
                dataSource.insertTopRowIn(tableView)
            }
        )
        self.listViewController = TableViewController(configuration: configuration)
        listViewController.title = NSLocalizedString("Boards", comment: "")
    }
    
    func start() {
        presenter.pushViewController(listViewController, animated: true)
    }
}