//
//  PaginationResponse.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/13/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation
import Himotoki

struct PaginationResponse<E: Decodable where E.DecodedType == E>: PaginationResponseType {
    typealias Element = E
    
    let elements: [Element]
    let hasNextPage: Bool
}