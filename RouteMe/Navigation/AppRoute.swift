//
//  AppRoute.swift
//  RouteMe
//
//  Created by KsArT on 04.02.2025.
//

import Foundation
import SwiftUICore

enum AppRoute: Hashable {
    case map
    case placeDetails(_ placeID: String)
    case profile
    
    var title: LocalizedStringKey {
        switch self {
        case .map:
            "Map"
        case .placeDetails:
            "Location details"
        case .profile:
            "Profile"
        }
    }
    
    var tabLabel: LocalizedStringKey {
        switch self {
        case .map:
            "Map"
        case .placeDetails:
            "Details"
        case .profile:
            "Profile"
        }
    }
    
    var tabIcon: String {
        switch self {
        case .map:
            "paperplane"
        case .placeDetails:
            "pencil.and.list.clipboard"
        case .profile:
            "person"
        }
    }
}
