//
//  HomeViewState.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

public enum HomeViewState: Equatable {
    case error(String)
    case loading
    case loaded(LoadedState)
    
    public struct LoadedState: Equatable {
        let energy: EnergyResponse
        let todayChartPoints: [ChartPoint]
        let averageChartPoints: [ChartPoint]
    }
}
