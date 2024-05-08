//
//  StandardFetchEnergyUseCaseTests.swift
//  bright-widget-appTests
//
//  Created by Luka Vujnovac on 5/8/24.
//

import bright_widget_app
import Dependencies
import XCTest

final class StandardFetchEnergyUseCaseTests: XCTestCase {
    
    private var mockHomeRepository: MockHomeRepository!
    private var sut: StandardFetchEnergyUseCase!

    override func setUp() {
        super.setUp()
        
        mockHomeRepository = MockHomeRepository()
        sut = withDependencies {
            $0.homeRepository = mockHomeRepository
        } operation: {
            StandardFetchEnergyUseCase()
        }
    }
    
    override func tearDown() {
        mockHomeRepository = nil
        sut = nil
        
        super.tearDown()
    }
    
    func test_execute_SHOULD_callRepository() {
        let _ = sut.execute()
        XCTAssertEqual(mockHomeRepository.fetchCallCount, 1)
    }
}
