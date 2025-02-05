//
//  RouteMeApp.swift
//  RouteMe
//
//  Created by KsArT on 03.02.2025.
//

import SwiftUI

@main
struct RouteMeApp: App {
    @Environment(\.container) private var diManager
    
    var body: some Scene {
        WindowGroup {
            AppRouterView(appRouter: diManager.resolve())
                .environment(\.container, diManager)
        }
    }
}
