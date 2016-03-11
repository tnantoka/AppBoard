//
//  DataType.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/11/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation
import RealmSwift

protocol DataType {
    typealias ItemType
    
    static func all() -> [ItemType]
    static func numberOfItems() -> Int
    static func itemAtPosition(position: Int) -> ItemType
    static func addNewItem(item: ItemType)
    static func deleteItemAtIndex(index: Int)
}

extension DataType where ItemType: Object {
    static func numberOfItems() -> Int {
        return all.count
    }
    
    static func itemAtPosition(position: Int) -> ItemType {
        return all[position]
    }
    
    static func addNewItem(item: ItemType) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(item)
        }
    }
    
    static func deleteItemAtIndex(index: Int) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(itemAtPosition(index))
        }
    }
    
    static var all: [ItemType] {
        return all()
    }
}

extension Board: DataType {
    typealias ItemType = Board
    
    static func all() -> [ItemType] {
        let realm = try! Realm()
        return realm.objects(ItemType).sorted("updatedAt", ascending: false).map { $0 }
    }
}

extension App: DataType {
    typealias ItemType = App
    
    static func all() -> [ItemType] {
        let realm = try! Realm()
        return realm.objects(ItemType).sorted("releasedAt", ascending: false).map { $0 }
    }
}
