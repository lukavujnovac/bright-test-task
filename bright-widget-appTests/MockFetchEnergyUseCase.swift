//
//  MockFetchEnergyUseCase.swift
//  bright-widget-appTests
//
//  Created by Luka Vujnovac on 5/8/24.
//

import Combine
import bright_widget_app

public final class MockFetchEnergyUseCase: FetchEnergyUseCase {
    
    public init() {}
    
    public enum MockError: Error {
        case failure
    }
    
    public private(set) var executeCallCount = 0
    public var fetchResult: Result<Response<EnergyResponse>, HomeRepositoryError> = Result.failure(.unknown(MockError.failure))
    
    public func execute() -> AnyPublisher<EnergyResponse, HomeRepositoryError> {
        executeCallCount += 1
        return fetchResult
            .publisher
            .map(\.data)
            .eraseToAnyPublisher()
            
    }
}
