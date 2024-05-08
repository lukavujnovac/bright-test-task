//
//  LocalDataProvider+Dependencies.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import Dependencies

private enum DataProviderDependencyKey: DependencyKey {
    static var liveValue: DataProvider = LocalDataProvider()
}

extension DependencyValues {
    public var dataProvider: DataProvider {
        get { self[DataProviderDependencyKey.self] }
        set { self[DataProviderDependencyKey.self] = newValue }
    }
}
