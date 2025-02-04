//
//  AppRoute.swift
//  RouteMe
//
//  Created by KsArT on 04.02.2025.
//

import Foundation

enum AppRoute: Hashable {
    case map
    case placeDetails(placeID: String)
    case profile
    
    var title: String {
        switch self {
        case .map:
            return "Карта"
        case .placeDetails:
            return "Детали места"
        case .profile:
            return "Профиль"
        }
    }
}
