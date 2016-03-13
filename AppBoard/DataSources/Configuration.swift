//
//  Configuration.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/11/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit

class Configuration<Data: DataType>: DataSource<Data>, UITableViewDelegate {
    typealias CongigureHandler = (cell: UITableViewCell, item: Data.ItemType) -> Void
    typealias SelectHandler = (item: Data.ItemType) -> Void
    typealias AddHandler = (tableView: UITableView, dataSource: DataSource<Data>) -> Void
    typealias SearchHandler = (query: String, tableView: UITableView, dataSource: DataSource<Data>) -> Void
    
    let cellStyle: UITableViewCellStyle
    let editable: Bool
    let configureCell: CongigureHandler
    let selectItem: SelectHandler
    let addItem: AddHandler?
    let searchItems: SearchHandler?
    
    var addable: Bool {
        return addItem != nil
    }
    
    var searchable: Bool {
        return searchItems != nil
    }
    
    init(dataObject: Data,
        cellStyle: UITableViewCellStyle,
        editable: Bool,
        configureCell: CongigureHandler,
        selectItem: SelectHandler,
        addItem: AddHandler? = nil,
        searchItems: SearchHandler? = nil) {
            self.cellStyle = cellStyle
            self.editable = editable
            self.configureCell = configureCell
            self.selectItem = selectItem
            self.addItem = addItem
            self.searchItems = searchItems
            super.init(dataObject: dataObject)
    }
    
    
    func addItemTo(tableView: UITableView) {
        addItem!(tableView: tableView, dataSource: self)
    }

    func searchItemsIn(tableView: UITableView, query: String) {
        searchItems!(query: query, tableView: tableView, dataSource: self)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier)
            ?? UITableViewCell(style: cellStyle, reuseIdentifier: reuseIdentifier)
        
        let item = dataObject.itemAtPosition(indexPath.row)
        configureCell(cell: cell, item: item)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = dataObject.itemAtPosition(indexPath.row)
        selectItem(item: item)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return editable
    }
}
