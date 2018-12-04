//
//  RouteConfigurations.swift
//  PerfectTemplate
//
//  Created by NTQ on 12/3/18.
//

import Foundation
import PerfectHTTP

protocol PFRouteConvertible {
    static var routes: [Route] { get }
}

enum RoutesConfigurations: String, CaseIterable {
    case xxx
    case user
    case zzz

    var routes: [Route] {
        switch self {
        case .user: return UserRoute.routes
        default: return XXX.routes
        }
    }
}
