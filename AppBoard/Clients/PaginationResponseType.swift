//
//  PaginationResponseType.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/13/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation
import Himotoki

protocol PaginationResponseType {
    typealias Element: Decodable
    
    var elements: [Element] { get }
    var hasNextPage: Bool { get }
    
    init(elements: [Element], hasNextPage: Bool)
}