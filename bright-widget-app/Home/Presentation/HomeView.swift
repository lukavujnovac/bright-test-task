//
//  HomeView.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import Charts
import SwiftUI

private enum Constants {
    static let circleSize = 8.0
}

struct HomeView<VM: ViewModel>: View where VM.ViewState == HomeViewState, VM.ViewEvent == HomeViewEvent {
    
    @StateObject private var viewModel: VM
    
    init(viewModel: VM) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .error(let error):
                Text("something went wrong: \(error)")
                
            case .loaded(let state):
                makeHomeContent(state: state)
                
            case .loading:
                ProgressView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundColor(.primaryBackground)
        .onAppear {
            viewModel.trigger(.onAppear)
        }
    }
}

private extension HomeView {
    func makeHomeContent(state: HomeViewState.LoadedState) -> some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: .spacing4) {
                Text("Energy Curve")
                    .textStyle(.body01)
                    .foregroundColor(.primaryText)
                    .opacity(0.8)
                
                HStack(spacing: .spacing6) {
                    calorieInfoView(for: "Today", amount: state.energy.todayValue)
                    calorieInfoView(for: "AVG", amount: state.energy.averageValue)
                }
                
                LineChartView(
                    activePoints: state.todayChartPoints,
                    averagePoints: state.averageChartPoints,
                    fullWidth: proxy.size.width - (.spacing4 * 2)
                )
            }
            .padding(.horizontal, .spacing5)
            .padding(.vertical, .spacing3)
            .backgroundColor(.cardBackground, in: .rect(cornerRadius: .standard))
            .padding(.horizontal, .spacing4)
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
    
    func calorieInfoView(for day: String, amount: Double) -> some View {
        VStack(alignment: .leading, spacing: .noSpacing) {
            Text(day)
                .textStyle(.body02)
                .foregroundColor(.primaryText)
                .opacity(0.6)
            
            HStack(spacing: .spacing2) {
                Circle()
                    .foregroundColor(day == "Today" ? .activityOrange : .secondaryText)
                    .frame(width: Constants.circleSize, height: Constants.circleSize)
                
                Text("\(amount.formatted(.number)) cal")
                    .textStyle(.title01)
                    .foregroundColor(day == "Today" ? .primaryText : .secondaryText)
            }
        }
    }
}

private extension HomeView {
    func getWidth(fullWidth: CGFloat) -> CGFloat {
        let currentTime = 15.0
        let timePercentage = currentTime / 24
        
        return fullWidth * timePercentage
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
