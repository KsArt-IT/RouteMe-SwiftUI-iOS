//
//  AppRouterKey.swift
//  RouteMe
//
//  Created by KsArT on 04.02.2025.
//

import Foundation
import SwiftUICore

struct AppRouterKey: EnvironmentKey {
    static let defaultValue = AppRouter()
}

extension EnvironmentValues {
    var appRouter: AppRouter {
        get { self[AppRouterKey.self] }
        set { self[AppRouterKey.self] = newValue }
    }
}
