//
//  ViewModel.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import Combine

public protocol ViewModel: ObservableObject where ObjectWillChangePublisher == ObservableObjectPublisher {
    associatedtype ViewEvent
    associatedtype ViewState

    func trigger(_ event: ViewEvent)
    var state: ViewState { get }
}

extension ViewModel where ViewEvent == Void {
    public func trigger(_ event: ViewEvent) { }
}

extension ViewModel where ViewEvent == Never {
    public func trigger(_ event: ViewEvent) { }
}

extension ViewModel where ViewState == Void {
    public var state: ViewState { () }
}
