//
//  DataSource.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/11/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit
import RealmSwift

class DataSource<Data: DataType>: NSObject, SourceType {

    let reuseIdentifier = "reuseIdentifier"
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.numberOfItems()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        fatalError("This method must be overriden.")
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            Data.deleteItemAtIndex(indexPath.row)
            deleteRowAtIndexPath(indexPath, from: tableView)
        }
    }
}
