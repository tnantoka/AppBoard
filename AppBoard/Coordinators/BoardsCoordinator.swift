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
    
    let appsCoordinator: AppsCoordinator

    private let listViewController: TableViewController<Board>
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        
        let appsCoordinator = AppsCoordinator(presenter: presenter)
        self.appsCoordinator = appsCoordinator
        
        let configuration = Configuration<Board>(
            cellStyle: .Default,
            configureCell: { cell, board in
                cell.textLabel?.text = board.name
            },
            selectItem: { board in
                print(board)
                appsCoordinator.start()
            },
            addItem: { tableView, dataSource in
                let board = Board()
                board.name = "taatt"
                Board.addNewItem(board)
                dataSource.insertTopRowIn(tableView)
            }
        )
        self.listViewController = TableViewController(configuration: configuration)
        
    }
    
    func start() {
        presenter.pushViewController(listViewController, animated: true)
    }
}