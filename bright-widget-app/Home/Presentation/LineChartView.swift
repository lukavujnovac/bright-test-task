//
//  LineChartView.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/8/24.
//

import Charts
import SwiftUI

private enum Constants {
    static let rectangleWidth = 1.0
    static let chartHeight = 96.0
}

struct LineChartView: View {
    let activePoints: [ChartPoint]
    let averagePoints: [ChartPoint]
    let fullWidth: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: .spacing4) {
            Chart {
                ForEach(averagePoints) { point in
                    point.dataX.map {
                        LineMark(
                            x: .value("Time", $0, unit: .hour),
                            y: .value("Value", point.dataY)
                        )
                        .foregroundStyle(Color.secondaryText)
                        .interpolationMethod(.catmullRom)
                    }
                    
                    if let dataX = point.dataX, dataX == activePoints.last?.dataX {
                        PointMark(
                            x: .value("Time", dataX),
                            y: .value("Value", point.dataY)
                        )
                        .foregroundStyle(Color.secondaryText)
                    }
                }
                
                ForEach(activePoints) { point in
                    point.dataX.map {
                        LineMark(
                            x: .value("Time", $0, unit: .hour),
                            y: .value("Value", point.dataY),
                            series: .value("", "Today")
                        )
                        .foregroundStyle(Color.activityOrange)
                        .interpolationMethod(.catmullRom)
                    }
                    
                    if point == activePoints.last {
                        point.dataX.map {
                            PointMark(
                                x: .value("Time", $0),
                                y: .value("Value", point.dataY)
                            )
                            .foregroundStyle(Color.activityOrange)
                        }
                    }
                }
                
                if let point = activePoints.last, let dataX = point.dataX {
                    RectangleMark(
                        x: .value("Time", dataX),
                        y: .value("Value", point.dataY),
                        width: .fixed(Constants.rectangleWidth),
                        height: .fixed(Constants.chartHeight)
                    )
                    .foregroundStyle(Color.primaryText)
                    .cornerRadius(.full)
                    .offset(y: 20)
                }
            }
            .frame(height: Constants.chartHeight, alignment: .bottomLeading)
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            
            Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .frame(height: 1)
                .foregroundColor(.primaryText)
                .opacity(0.3)
            
            ZStack {
                Text("12am")
                    .textStyle(.body01)
                    .foregroundColor(.primaryText)
                    .opacity(0.6)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("3pm")
                    .textStyle(.body01)
                    .foregroundColor(.primaryText)
                    .opacity(0.8)
                    .offset(x: -(fullWidth / 2) * (15 / 24))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("12am")
                    .textStyle(.body01)
                    .foregroundColor(.primaryText)
                    .opacity(0.6)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    GeometryReader { proxy in
        LineChartView(
            activePoints: [],
            averagePoints: [],
            fullWidth: proxy.size.width
        )
        .padding()
        .backgroundColor(.cardBackground)
        .frame(width: proxy.size.width, height: proxy.size.height)
    }
}
