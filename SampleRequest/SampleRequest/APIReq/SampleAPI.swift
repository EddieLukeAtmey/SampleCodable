//
//  SampleAPI.swift
//  SampleCodable
//
//  Created by NTQ on 12/4/18.
//  Copyright © 2018 NTQ. All rights reserved.
//

import Foundation
import CodableAlamofire
import Alamofire
import SampleCodable

struct SCRequest {
//
//    private static let manager: SessionManager = {
//
//        var defaultHeaders = SessionManager.defaultHTTPHeaders
//        defaultHeaders["Content-Type"] = "application/json;charset=UTF-8"
//        defaultHeaders["Accept"] = "application/json"
//        let configuration = URLSessionConfiguration.default
//        configuration.httpAdditionalHeaders = defaultHeaders
//        configuration.timeoutIntervalForRequest = 10 // seconds
//        configuration.timeoutIntervalForResource = 10
//        return SessionManager(configuration: configuration)
//    }()
//
//    @discardableResult
//    static func request<T: Decodable>(_ request: URLRequestConvertible, requiredToken: Bool = false,
//                                                callback: @escaping (T?, String?) -> Void) -> Request {
//
//        //        logRequest(request) // can log manually (using debugger)
//
//        return manager.request(request).responseDecodableObject() { (response: DataResponse<T>) in
//
//            logRequest(request)
//
//            // Log response
//            if let errors = handleError(response: response) {
//                callback(nil, errors)
//                return
//            }
//
//            // Parse and callback
//            var result = response.result.value
//            callback(result?.loadModel(T.self), nil)
//        }
//    }
//
//    private static func handleError(response: DataResponse<CommonResponseModel>) -> [CommonError]? {
//        var errors = [CommonError]()
//        var basicError = CommonError()
//        basicError.args = ""
//        basicError.errorCode = "-9999"
//        basicError.errorMessage = "wrong format json"
//        basicError.property = "XXX-XX"
//
//        if let error = response.error as NSError? {
//            print("RESPONSE ERROR: \(error)")
//            guard let statusCode = response.response?.statusCode else {
//                basicError.errorCode = "\(error.code)"
//                basicError.errorMessage = error.code == NSURLErrorTimedOut ? "error time out" : "unknown error"
//                errors.append(basicError)
//                return errors
//            }
//
//            basicError.errorMessage = "System error"
//            basicError.errorCode = "\(statusCode)"
//            errors.append(basicError)
//            return errors
//        }
//
//        guard let result = response.result.value else { errors.append(basicError); return errors }
//
//        if let data = response.data, let body = String(data: data, encoding: .utf8) {
//            print("\nRESPONSE BODY")
//            print(body)
//        }
//        return result.meta.status == MetaStatus.OK ? nil : result.errors
//    }
//
//    private static func logRequest(_ req: URLRequestConvertible) {
//
//        // Log request
//        print("\n---------------------------------\n")
//        print("REQUEST: \(req.urlRequest?.description ?? "No request")")
//        print("HEADER: \(req.urlRequest?.allHTTPHeaderFields?.description ?? "")")
//        print("PARAM:")
//
//        if let data = req.urlRequest?.httpBody, let paramString = String(data: data, encoding: .utf8) {
//            print(paramString)
//        }
//    }

    static func requestUser(completion: @escaping (User?, String?) -> Void) {
        Alamofire.request("http://localhost:8181/user").responseDecodableObject { (response: DataResponse<CommonResponse<User>>) in
            logResponse(response)
            completion(response.value?.body, nil)
        }
    }

    private static func logResponse<T>(_ response: DataResponse<T>) {

        // System error
        if let err = response.error {
            print("System error: \(err)")
            return
        }

        if let data = response.data, let body = String(data: data, encoding: .utf8) {
            print("\nRESPONSE BODY")
            print(body)
        }
    }
}
