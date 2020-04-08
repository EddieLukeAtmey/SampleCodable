//
//  CommonModels.swift
//  SampleCodable
//
//  Created by Eddie on 4/8/20.
//  Copyright © 2020 Eddie. All rights reserved.
//

import Foundation

protocol CommonModelProtocol: Decodable {
    var success: Bool?
    var message: String?
}
struct CommonModel<M: Decodable>: CommonModelProtocol {
    var success: Bool?
    var data: M?
    var message: String?
}

struct EmptyModel: Decodable {}

/// Listing model with paging info
struct PaginationModel<M: Decodable>: Decodable {

    // Page URL
    var firstPageUrl: URL?
    var lastPageUrl: URL?
    var nextPageUrl: URL?
    var prevPageUrl: URL?

    var path: String?
    // Page Index
    var currentPage: Int
    var lastPage: Int?
    var from: Int?
    var to: Int?
    var perPage: String?
    var total: Int?

    // The actual data
    var data: [M]?
}
