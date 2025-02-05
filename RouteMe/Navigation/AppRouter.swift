//
//  AppRouter.swift
//  RouteMe
//
//  Created by KsArT on 04.02.2025.
//

import Foundation

final class AppRouter: ObservableObject {
    @Published var currentRoute: AppRoute = .map
    
    func navigate(to route: AppRoute) {
        currentRoute = route
    }
}
