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
        TabView(selection: $appRouter.currentRoute) {
            VStack {
                Text(AppRoute.map.title)
            }
            .tabMenu(AppRoute.map)
            VStack {
                Text(AppRoute.placeDetails("").title)
            }
            .tabMenu(AppRoute.placeDetails(""))
            VStack {
                Text(AppRoute.profile.title)
            }
            .tabMenu(AppRoute.profile)
        }
        .environment(\.appRouter, appRouter)
    }
}

fileprivate extension View {
    @ViewBuilder
    func tabMenu (_ router: AppRoute) -> some View {
        self
            .tag(router)
            .tabItem {
                Label {
                    Text(router.tabLabel)
                } icon: {
                    Image(systemName: router.tabIcon)
                }
            }
        // изменить цвет TabView, необходимо для каждого, поэтому расположено тут
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.ultraThickMaterial, for: .tabBar)
    }
}

#Preview {
    //    AppRouterView()
}
