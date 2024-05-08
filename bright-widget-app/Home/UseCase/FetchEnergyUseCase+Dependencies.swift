//
//  FetchEnergyUseCase+Dependencies.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/8/24.
//

import Dependencies

private enum FetchEnergyUseCaseDependencyKey: DependencyKey {
    static var liveValue: FetchEnergyUseCase = StandardFetchEnergyUseCase()
}

extension DependencyValues {
    public var fetchEnergyUseCase: FetchEnergyUseCase {
        get { self[FetchEnergyUseCaseDependencyKey.self] }
        set { self[FetchEnergyUseCaseDependencyKey.self] = newValue }
    }
}
