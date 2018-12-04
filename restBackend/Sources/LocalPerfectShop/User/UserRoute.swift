//
//  UserRoute.swift
//  LocalPerfectShop
//
//  Created by NTQ on 12/4/18.
//

import Foundation
import PerfectHTTP
import SampleCodable

struct UserRoute: PFRouteConvertible {
    static var routes: [Route] = {
        var routes = [Route]()
        routes.append(Route(method: .get, uri: "/user", handler: handler))
        return routes
    }()

    private static func handler(request: HTTPRequest, response: HTTPResponse) {
        let u = User(username: "2", age: 24)
        GFResponse(response, body: u)

    }
}
