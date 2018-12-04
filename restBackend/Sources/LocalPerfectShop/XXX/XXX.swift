//
//  XXX.swift
//  PerfectTemplate
//
//  Created by NTQ on 12/3/18.
//

import PerfectHTTP
import Foundation

struct XXX: PFRouteConvertible {

    static var routes: [Route] = {
        var routes = [Route]()
        routes.append(Route(method: .get, uri: "/XXX", handler: handler))
        return routes
    }()

    static func handler(request: HTTPRequest, response: HTTPResponse) {
        GFResponse(response, body: "XXX")
    }

}
