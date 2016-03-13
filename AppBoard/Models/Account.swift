//
//  Account.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/12/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation
import RealmSwift

struct Account {
}

extension Account: DataType {
    typealias ItemType = Board

    func addNewItem(item: ItemType) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(item)
        }
    }
    
    func deleteItemAtIndex(index: Int) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(itemAtPosition(index))
        }
    }

    var all: [ItemType] {
        let realm = try! Realm()
        return realm.objects(ItemType).sorted("updatedAt", ascending: false).map { $0 }
    }
}
