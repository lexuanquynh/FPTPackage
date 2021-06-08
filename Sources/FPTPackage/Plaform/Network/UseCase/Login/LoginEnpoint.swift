//
//  LoginEnpoint.swift
//  FPTBaseFramework
//
//  Created by xuanquynhle on 2021/06/05.
//

import Foundation

/// Login Enpoint
enum LoginEnpoint {
    case login(parameters: [String: Any?])
}

extension LoginEnpoint: RequestProtocol {
    var path: String {
        switch self {
        case .login(_):
            return "/login"
        }
    }

    var method: RequestMethod {
        switch self {
        case .login(_):
            return .post
        }
    }

    var headers: ReaquestHeaders? {
        return nil
    }

    var parameters: RequestParameters? {
        switch self {
        case .login(let parameters):
            return parameters
        }
    }

    var requestType: RequestType {
        return .data
    }

    var responseType: ResponseType {
        return .json
    }

    var progressHandler: ProgressHandler? {
        get { nil }
        set { }
    }
}
