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
    
    var apps: [App] {
        return linkingObjects(App.self, forProperty: "board")
    }
}