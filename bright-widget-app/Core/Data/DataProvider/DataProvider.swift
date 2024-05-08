//
//  DataProvider.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import Combine

public protocol DataProvider: AnyObject {
    @discardableResult
    func fetch<T: Decodable>(for resource: String, withExtension extension: String) -> AnyPublisher<T, Error>
}
