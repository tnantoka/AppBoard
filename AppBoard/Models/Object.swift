//
//  Object.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/12/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation
import RealmSwift

extension DataType where ItemType: Object {
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
}
