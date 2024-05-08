//
//  HomeRepositoryError.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import Foundation

public enum HomeRepositoryError: Error {
    
    case fileNotFound
    case unknown(Error)
    
    static func map(_ error: Error) -> Self {
        let nsError = error as NSError
        if nsError.domain == NSCocoaErrorDomain && nsError.code == NSFileReadNoSuchFileError {
            return .fileNotFound
        }
        return .unknown(error)
    }
}
