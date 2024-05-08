//
//  HomeViewModel.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import Combine
import Dependencies
import Foundation

public final class HomeViewModel: ViewModel {
    
    @Dependency(\.fetchEnergyUseCase) private var fetchEnergyUseCase
    
    private let onAppearSubject = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    @Published public private(set) var state: HomeViewState
    
    public init() {
        self.state = .loading
        bindOnAppear()
    }
    
    public func trigger(_ event: HomeViewEvent) {
        switch event {
        case .onAppear:
            onAppearSubject.send()
        }
    }
    
    private func bindOnAppear() {
        onAppearSubject
            .first()
            .flatMap { [unowned self] in
                fetchEnergy()
            }
            .sink { [unowned self] in
                var averagePoints = [ChartPoint]()
                var todayPoints = [ChartPoint]()
                for (x, y) in zip($0.averageDataX, $0.averageDataY) {
                    averagePoints.append(ChartPoint(name: "Average", dataX: x.toDate(), dataY: y))
                }
                for (x, y) in zip($0.todayDataX, $0.todayDataY) {
                    todayPoints.append(ChartPoint(name: "Today", dataX: x.toDate(), dataY: y))
                }
                state = .loaded(
                    HomeViewState.LoadedState(
                        energy: $0,
                        todayChartPoints: todayPoints,
                        averageChartPoints: averagePoints
                    )
                )
            }
            .store(in: &cancellables)
    }
    
    private func fetchEnergy() -> AnyPublisher<EnergyResponse, Never> {
        fetchEnergyUseCase.execute()
            .catch { error -> AnyPublisher<EnergyResponse, Never> in
                self.state = .error(error.localizedDescription)
                return Empty().eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
