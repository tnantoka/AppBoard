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
    
    let cellStyle: UITableViewCellStyle
    let configureCell: CongigureHandler
    let selectItem: SelectHandler
    let addItem: AddHandler?
    
    var addable: Bool {
        return addItem != nil
    }
    
    init(cellStyle: UITableViewCellStyle, configureCell: CongigureHandler, selectItem: SelectHandler, addItem: AddHandler) {
        self.cellStyle = cellStyle
        self.configureCell = configureCell
        self.selectItem = selectItem
        self.addItem = addItem
    }
    
    
    func addItemTo(tableView: UITableView) {
        addItem!(tableView: tableView, dataSource: self)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier)
            ?? UITableViewCell(style: .Default, reuseIdentifier: reuseIdentifier)
        
        let item = Data.itemAtPosition(indexPath.row)
        configureCell(cell: cell, item: item)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = Data.itemAtPosition(indexPath.row)
        selectItem(item: item)
    }
}
