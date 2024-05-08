//
//  FetchEnergyUseCase.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/8/24.
//

import Combine

public protocol FetchEnergyUseCase {
    func execute() -> AnyPublisher<EnergyResponse, HomeRepositoryError>
}
