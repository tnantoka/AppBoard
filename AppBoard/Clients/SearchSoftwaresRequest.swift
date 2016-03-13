//
//  SearchSoftwaresRequest.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/13/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation
import APIKit

extension ITunesAPI {
    struct SearchSoftwaresRequest: ITunesRequestType, PaginationRequestType {
        typealias Response = PaginationResponse<Software>
        
        let query: String
        let page: Int
        
        var locale = NSLocale.currentLocale()
        
        var method: HTTPMethod {
            return .GET
        }
        
        var path: String {
            return "/search"
        }
        
        var parameters: [String: AnyObject] {
            let lang = locale.localeIdentifier
            let country = locale.objectForKey(NSLocaleCountryCode) as? String ?? ""
            
            return [
                "media": "software",
                "entity": "software",
                "lang": lang,
                "country": country,
                "term": query
            ]
        }
        
        init(query: String, page: Int = 1) {
            self.query = query
            self.page = page
            
        }

        func requestWithPage(page: Int) -> SearchSoftwaresRequest {
            return SearchSoftwaresRequest(query: query, page: page)
        }
    }
}
