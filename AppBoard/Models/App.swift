//
//  App.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/10/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation
import RealmSwift

class App: Object {
    dynamic var name = ""
    dynamic var releasedAt = NSDate()
    dynamic var icon = ""
    
    var board: Board {
        return linkingObjects(Board.self, forProperty: "apps").first!
    }
}