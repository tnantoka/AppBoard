//
//  App.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/10/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation
import RealmSwift
import Himotoki

class App: Object {
    dynamic var name = ""
    dynamic var desc = ""
    dynamic var icon = ""
    dynamic var url = ""
    dynamic var releasedAt = NSDate()

    var board: Board {
        return linkingObjects(Board.self, forProperty: "apps").first!
    }    
}