//
//  Board.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/10/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation
import RealmSwift

class Board: Object {    
    dynamic var name = ""
    dynamic var updatedAt = NSDate()
    
    let apps = List<App>()
}

extension Board: DataType {
    typealias ItemType = App
    
    var all: [ItemType] {
        return self.apps.sorted("releasedAt", ascending: false).map { $0 }
    }
    
    func addNewItem(item: ItemType) {
        let realm = try! Realm()
        try! realm.write {
            apps.append(item)
        }
    }
}
