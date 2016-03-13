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

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if configuration.searchable {
            searchBar.becomeFirstResponder()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
