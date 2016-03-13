//
//  PaginationRequestType.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/13/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation
import APIKit

protocol PaginationRequestType: RequestType {
    typealias Response: PaginationResponseType
    
    var page: Int { get }
    
    func requestWithPage(page: Int) -> Self
}