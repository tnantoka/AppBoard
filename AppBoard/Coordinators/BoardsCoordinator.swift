//
//  BoardsCoordinator.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/10/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit

struct BoardsCoordinator: Coordinator {
    
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
                let alertController = UIAlertController(
                    title: NSLocalizedString("Add New Board", comment: ""),
                    message: nil,
                    preferredStyle: .Alert
                )
                alertController.addTextFieldWithConfigurationHandler { textField in
                    textField.placeholder = NSLocalizedString("Name", comment: "")
                }
                alertController.addAction(
                    UIAlertAction(
                        title: NSLocalizedString("Add", comment: ""),
                        style: .Default,
                        handler: { _ in
                            guard let text = alertController.textFields?.first?.text where !text.isEmpty else { return }
                            let board = Board()
                            board.name = text
                            account.addNewItem(board)
                            dataSource.insertTopRowIn(tableView)
                        }
                    )
                )
                alertController.addAction(
                    UIAlertAction(
                        title: NSLocalizedString("Cancel", comment: ""),
                        style: .Cancel,
                        handler: nil
                    )
                )
                presenter.presentViewController(alertController, animated: true, completion: nil)
            }
        )
        self.listViewController = TableViewController(configuration: configuration)
        listViewController.title = NSLocalizedString("Boards", comment: "")
    }
    
    func start() {
        presenter.pushViewController(listViewController, animated: true)
    }
}