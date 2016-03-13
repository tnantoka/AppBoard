//
//  ITunesAPIType.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/13/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

protocol ITunesRequestType: RequestType {
}

extension ITunesRequestType {
    var baseURL: NSURL {
        return NSURL(string: "https://itunes.apple.com")!
    }
}

extension ITunesRequestType where Response: PaginationResponseType, Response.Element.DecodedType == Response.Element {
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
        let elements = try? decodeArray(object, rootKeyPath: "results") as [Response.Element]
        return elements.map { Response(elements: $0, hasNextPage: false) }
    }
}