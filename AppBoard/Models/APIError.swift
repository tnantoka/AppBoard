//
//  APIError.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/13/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import Foundation
import APIKit

extension APIError {
    var localizedDescription: String {
        switch self {
        case .ConnectionError(let error):
            return error.localizedDescription
        case .InvalidBaseURL(_):
            return NSLocalizedString("Invalid Base URL", comment: "")
        case .ConfigurationError(_):
            return NSLocalizedString("Configuration Error", comment: "")
        case .RequestBodySerializationError(_):
            return NSLocalizedString("Request Body Serialization Error", comment: "")
        case .UnacceptableStatusCode(_):
            return NSLocalizedString("Unacceptable Status Code", comment: "")
        case .ResponseBodyDeserializationError(_):
            return NSLocalizedString("Response Body Deserialization Error", comment: "")
        case .InvalidResponseStructure(_):
            return NSLocalizedString("Invalid Response Structure", comment: "")
        case .NotHTTPURLResponse(_):
            return NSLocalizedString("Not HTTP URL Response", comment: "")
        }
    }
}