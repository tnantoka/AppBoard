//
//  SearchCoordinator.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/12/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit
import APIKit

struct SearchCoordinator: Coordinator {
    
    let presenter: UINavigationController
    
    private let listViewController: TableViewController<Search>
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        
        let search = Search()
        let configuration = Configuration(
            dataObject: search,
            cellStyle: .Default,
            editable: true,
            configureCell: { cell, app in
                cell.textLabel?.text = app.name
            },
            selectItem: { app in
                print(app)
            },
            searchItems: { query, tableView, dataSource in
                let request = ITunesAPI.SearchSoftwaresRequest(query: query).requestWithPage(1)
                Session.sendRequest(request) { result in
                    switch result {
                    case .Success(let response):
                        search.results = response.elements
                        tableView.reloadData()
                    case .Failure(let error):
                        let errorCoordinator = ErrorCoordinator(presenter: presenter, error: error.localizedDescription)
                        errorCoordinator.start()
                    }
                }
            }
        )
        self.listViewController = TableViewController(configuration: configuration)
    }
    
    func start() {
        presenter.pushViewController(listViewController, animated: true)
    }
}
