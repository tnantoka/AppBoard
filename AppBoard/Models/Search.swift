//
//  Search.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/13/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation

class Search: DataType {
    typealias ItemType = Software
    
    var results = [ItemType]()
    
    var all: [ItemType] {
        return results
    }
}
