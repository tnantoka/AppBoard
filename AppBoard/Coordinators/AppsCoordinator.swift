//
//  AppsCoordinator.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/12/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit

struct AppsCoordinator: Coordinator {
    
    let presenter: UINavigationController
    
    private let listViewController: TableViewController<Board>
    
    let board: Board
    
    init(presenter: UINavigationController, board: Board) {
        self.presenter = presenter
        self.board = board
        
        let configuration = Configuration(
            dataObject: board,
            cellStyle: .Default,
            editable: true,
            configureCell: { cell, app in
                cell.textLabel?.text = app.name
            },
            selectItem: { app in
                print(app)
            },
            addItem: { tableView, dataSource in
//                let app = App()
//                app.name = "taatt"
//                board.addNewItem(app)
//                dataSource.insertTopRowIn(tableView)
                
                let searchCoordinator = SearchCoordinator(presenter: presenter)
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