//
//  AppRouterView.swift
//  RouteMe
//
//  Created by KsArT on 05.02.2025.
//

import SwiftUI

struct AppRouterView: View {
    @Environment(\.container) private var diManager
    @StateObject var appRouter: AppRouter
    
    var body: some View {
        NavigationStack {
            switch appRouter.currentRoute {
            case .map:
                VStack {
                    Text("Ok")
                }
            case .placeDetails(let placeID):
                EmptyView()
            case .profile:
                EmptyView()
            }
        }
        .navigationTitle(appRouter.currentRoute.title)
        .environment(\.appRouter, appRouter)
    }
}

#Preview {
//    AppRouterView()
}
