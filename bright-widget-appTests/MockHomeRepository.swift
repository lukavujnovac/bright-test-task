//
//  MockHomeRepository.swift
//  bright-widget-appTests
//
//  Created by Luka Vujnovac on 5/8/24.
//

import Combine
import bright_widget_app

public final class MockHomeRepository: HomeRepository {
    
    public init() {}
    
    public enum MockError: Error {
        case failure
    }
    
    public private(set) var fetchCallCount = 0
    public var fetchResult: Result<Response<EnergyResponse>, HomeRepositoryError> = Result.failure(HomeRepositoryError.unknown(MockError.failure))
    public var fetchResultPublisher: AnyPublisher<Response<EnergyResponse>, HomeRepositoryError>?
    
    public func fetchEnergy() -> AnyPublisher<Response<EnergyResponse>, HomeRepositoryError> {
        fetchCallCount += 1
        
        guard let fetchResultPublisher else {
            return fetchResult
                .publisher
                .eraseToAnyPublisher()
        }
        
        return fetchResultPublisher
    }
}
