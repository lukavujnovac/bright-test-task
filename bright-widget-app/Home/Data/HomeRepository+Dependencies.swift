//
//  HomeRepository+Dependencies.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import Dependencies

private enum HomeRepositoryDependencyKey: DependencyKey {
    static var liveValue: HomeRepository = StandardHomeRepository()
}

extension DependencyValues {
    public var homeRepository: HomeRepository {
        get { self[HomeRepositoryDependencyKey.self] }
        set { self[HomeRepositoryDependencyKey.self] = newValue }
    }
}
