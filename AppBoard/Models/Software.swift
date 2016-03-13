//
//  Software.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/13/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit
import Himotoki

struct Software: Decodable {
    let name: String
    let description: String
    let iconURL: NSURL?
    let viewURL: NSURL?
    let releaseDate: NSDate?
    let thumbnail: UIImage?

    static func decode(e: Extractor) throws -> Software {        
        return try Software(
            name: e.value("trackName"),
            description: e.value("description"),
            iconURL: e.valueOptional("artworkUrl512").flatMap { NSURL(string: $0) },
            viewURL: e.valueOptional("trackViewUrl").flatMap { NSURL(string: $0) },
            releaseDate: e.valueOptional("releaseDate").flatMap { parseDate($0) },
            thumbnail: e.valueOptional("artworkUrl60").flatMap { NSURL(string: $0) }.flatMap { NSData(contentsOfURL: $0) }.flatMap { UIImage(data: $0) }
        )
    }
    
    static func parseDate(string: String) -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.dateFromString(string)
    }

    var app: App {
        let app = App()
        app.name = name
        app.desc = description
        app.icon = iconURL?.absoluteString ?? ""
        app.url = viewURL?.absoluteString ?? ""
        app.releasedAt = releaseDate ?? NSDate()
        return app
    }
}
