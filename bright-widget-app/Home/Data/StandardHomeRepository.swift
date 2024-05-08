//
//  StandardHomeRepository.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import Combine
import Dependencies

class StandardHomeRepository: HomeRepository {
    
    @Dependency(\.dataProvider) private var dataProvider
    
    func fetchEnergy() -> AnyPublisher<Response<EnergyResponse>, HomeRepositoryError> {
        dataProvider.fetch(for: "sample1", withExtension: "json")
            .mapError { HomeRepositoryError.map($0) }
            .eraseToAnyPublisher()
    }
}


