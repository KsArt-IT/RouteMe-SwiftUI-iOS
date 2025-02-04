//
//  AppRouter.swift
//  RouteMe
//
//  Created by KsArT on 04.02.2025.
//

import SwiftUI

final class AppRouter: ObservableObject {
    @Published var currentRoute: AppRoute = .map
    
    @ViewBuilder
    func start() -> some View {
        switch currentRoute {
        case .map:
            EmptyView()
        case .placeDetails(let placeID):
            EmptyView()
        case .profile:
            EmptyView()
        }
    }
    
    func navigate(to route: AppRoute) {
        withAnimation {
            currentRoute = route
        }
    }
}
