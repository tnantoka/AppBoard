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
import UIKit

class App: Object {
    dynamic var name = ""
    dynamic var desc = ""
    dynamic var icon = ""
    dynamic var url = ""
    dynamic var releasedAt = NSDate()

    var board: Board {
        return linkingObjects(Board.self, forProperty: "apps").first!
    }
    
    lazy var iconImage: UIImage? = {
        return NSURL(string: self.icon).flatMap { NSData(contentsOfURL: $0) }.flatMap { UIImage(data: $0) }
    }()
    
    override class func ignoredProperties() -> [String] {
        return ["iconImage"]
    }
}