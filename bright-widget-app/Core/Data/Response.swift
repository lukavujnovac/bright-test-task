//
//  Response.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import Foundation

public struct Response<T: Decodable>: Decodable {
    public let status: String
    public let message: String?
    public let code: Int
    public let data: T
}
