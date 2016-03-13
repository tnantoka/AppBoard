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
    let dataObject: Data
    
    init(dataObject: Data) {
        self.dataObject = dataObject
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataObject.numberOfItems
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        fatalError("This method must be overriden.")
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            dataObject.deleteItemAtIndex(indexPath.row)
            deleteRowAtIndexPath(indexPath, from: tableView)
        }
    }
}
