//
//  StandardFetchEnergyUseCase.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/8/24.
//

import Combine
import Dependencies

public struct StandardFetchEnergyUseCase: FetchEnergyUseCase {
    
    @Dependency(\.homeRepository) private var homeRepository
    
    public init() {}
    
    public func execute() -> AnyPublisher<EnergyResponse, HomeRepositoryError> {
        homeRepository.fetchEnergy()
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
