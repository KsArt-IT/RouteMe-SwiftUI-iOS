//
//  DIManager.swift
//  RouteMe
//
//  Created by KsArT on 04.02.2025.
//

import Swinject

final class DIManager {
    static let shared = DIManager()
    private let container: Container
    
    private init() {
        container = Container()
        registerDependencies()
    }
    
    // MARK: - Registering dependencies
    private func registerDependencies() {
        let assemblies: [Assembly] = [
            AppAssembly(),
        ]
        assemblies.forEach { $0.assemble(container: container) }
    }
    
    // MARK: - Getting dependencies
    public func resolve<T>() -> T {
        resolve(T.self)
    }
    
    public func resolve<T>(_ type: T.Type) -> T {
        guard let dependency = container.resolve(type) else {
            fatalError("Dependency \(type) could not be resolved!")
        }
        return dependency
    }
}
