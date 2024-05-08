//
//  EnergyResponse.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import Foundation

public struct EnergyResponse: Decodable, Hashable {
    public let currentTime: String
    public let unit: String
    public let todayValue: Double
    public let averageValue: Double
    public let todayDataX: [String]
    public let todayDataY: [Double]
    public let averageDataX: [String]
    public let averageDataY: [Double]
    
    public init(
        currentTime: String,
        unit: String,
        todayValue: Double,
        averageValue: Double,
        todayDataX: [String],
        todayDataY: [Double],
        averageDataX: [String],
        averageDataY: [Double]
    ) {
        self.currentTime = currentTime
        self.unit = unit
        self.todayValue = todayValue
        self.averageValue = averageValue
        self.todayDataX = todayDataX
        self.todayDataY = todayDataY
        self.averageDataX = averageDataX
        self.averageDataY = averageDataY
    }
}

struct ChartPoint: Identifiable, Equatable {
    let id: UUID = UUID()
    let name: String
    let dataX: Date?
    let dataY: Double
}
