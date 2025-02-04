//
//  DIContainerKey.swift
//  RouteMe
//
//  Created by KsArT on 04.02.2025.
//

import Foundation
import SwiftUICore

struct DIContainerKey: EnvironmentKey {
    static let defaultValue = DIManager.shared
}

extension EnvironmentValues {
    var container: DIManager {
        get { self[DIContainerKey.self] }
        set { self[DIContainerKey.self] = newValue }
    }
}
