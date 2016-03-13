//
//  DataType.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/11/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation

protocol DataType {
    typealias ItemType
    
    var all: [ItemType] { get }
    var numberOfItems: Int { get }
    
    func itemAtPosition(position: Int) -> ItemType
    func addNewItem(item: ItemType)
    func deleteItemAtIndex(index: Int)
}

extension DataType {
    var numberOfItems: Int {
        return all.count
    }
    
    func itemAtPosition(position: Int) -> ItemType {
        return all[position]
    }
    
    func addNewItem(item: ItemType) {
    }
    
    func deleteItemAtIndex(index: Int) {
    }
}

