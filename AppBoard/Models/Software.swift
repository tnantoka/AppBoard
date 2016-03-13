//
//  Software.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/13/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation
import Himotoki

struct Software: Decodable {
    let name: String
    let description: String
    let icon: String
    let url: NSURL?
    
    static func decode(e: Extractor) throws -> Software {
        return try Software(
            name: e.value("trackName"),
            description: e.value("description"),
            icon: e.value("artworkUrl512"),
            url: e.valueOptional("trackViewUrl").flatMap { NSURL(string: $0) }
        )
    }
}