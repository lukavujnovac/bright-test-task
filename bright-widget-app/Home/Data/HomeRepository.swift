//
//  DataProvider.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import Combine

public protocol HomeRepository {
    func fetchEnergy() -> AnyPublisher<Response<EnergyResponse>, HomeRepositoryError>
}
