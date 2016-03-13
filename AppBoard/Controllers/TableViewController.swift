//
//  TableViewController.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/10/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit

class TableViewController<Data: DataType>: UITableViewController, UISearchBarDelegate {

    let configuration: Configuration<Data>

    let searchBar = UISearchBar()

    init(configuration: Configuration<Data>) {
        self.configuration = configuration
        super.init(style: .Plain)
        tableView.dataSource = configuration
        tableView.delegate = configuration
        
        if configuration.addable {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "add")
        }
        
        if configuration.searchable {
            searchBar.delegate = self
            navigationItem.titleView = searchBar
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if configuration.searchable {
            searchBar.becomeFirstResponder()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func add() {
        configuration.addItemTo(tableView)
    }
    
    // MARK: - UISearchBarDelegate

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let text = searchBar.text where !text.isEmpty else { return }
        
        configuration.searchItemsIn(tableView, query: text)
    }
}
