//
//  AppsCoordinator.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/12/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit
import Symday

struct AppsCoordinator: Coordinator {
    
    let presenter: UINavigationController
    
    private let listViewController: TableViewController<Board>
    
    let board: Board
    
    init(presenter: UINavigationController, board: Board) {
        self.presenter = presenter
        self.board = board
        
        let configuration = Configuration(
            dataObject: board,
            cellStyle: .Subtitle,
            editable: true,
            configureCell: { cell, app in
                cell.textLabel?.text = app.name
                cell.detailTextLabel?.text = Symday().format(app.releasedAt)
                cell.imageView?.image = app.iconImage
            },
            selectItem: { app in
                let appCoordinator = AppCoordinator(presenter: presenter, app: app)
                appCoordinator.start()
            },
            addItem: { tableView, dataSource in
                let searchCoordinator = SearchCoordinator(presenter: presenter, didSelect: { app in
                    let alertController = UIAlertController(
                        title: NSLocalizedString("Add to Board", comment: ""),
                        message: app.name,
                        preferredStyle: .Alert
                    )
                    alertController.addAction(
                        UIAlertAction(
                            title: NSLocalizedString("Add", comment: ""),
                            style: .Default,
                            handler: { _ in
                                board.addNewItem(app)
                                presenter.popViewControllerAnimated(true)
                                tableView.reloadData()
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
                })
                searchCoordinator.start()
            }
        )
        self.listViewController = TableViewController(configuration: configuration)
        listViewController.title = board.name
    }
    
    func start() {
        presenter.pushViewController(listViewController, animated: true)
    }
}