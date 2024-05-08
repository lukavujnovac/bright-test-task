//
//  bright_widget_appApp.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import SwiftUI

@main
struct bright_widget_appApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
