//
//  HomeViewModelTests.swift
//  bright-widget-appTests
//
//  Created by Luka Vujnovac on 5/8/24.
//

import bright_widget_app
import Dependencies
import XCTest

final class HomeViewModelTests: XCTestCase {

    private var mockFetchEnergyUseCase: MockFetchEnergyUseCase!
    private var sut: HomeViewModel!
    
    enum MockError: Error {
        case failure(String)
    }
    
    override func setUp() {
        super.setUp()
        
        mockFetchEnergyUseCase = MockFetchEnergyUseCase()
        
        sut = withDependencies {
            $0.fetchEnergyUseCase = mockFetchEnergyUseCase
        } operation: {
            HomeViewModel()
        }
    }
    
    override func tearDown() {
        mockFetchEnergyUseCase = nil
        sut = nil
        
        super.tearDown()
    }
    
    func test_state_SHOULD_defaultToLoading() {
        XCTAssertEqual(sut.state, .loading)
    }
    
    func test_onAppear_SHOULD_fetchEnergy() {
        sut.trigger(.onAppear)
        
        XCTAssertEqual(mockFetchEnergyUseCase.executeCallCount, 1)
    }
}
