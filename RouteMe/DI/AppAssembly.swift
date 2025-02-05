//
//  AppAssembly.swift
//  RouteMe
//
//  Created by KsArT on 04.02.2025.
//

import Swinject

final class AppAssembly: Assembly {
    func assemble(container: Container) {
        
        // Регистрация ViewModels
        container.register(AppRouter.self) { _ in
            AppRouter()
        }
    }
}
