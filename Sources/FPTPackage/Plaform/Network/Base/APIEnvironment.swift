//
//  APIEnvironment.swift
//  FPTBaseFramework
//
//  Created by xuanquynhle on 2021/06/05.
//

import Foundation

/// Protocol to which environments must conform.
protocol EnvironmentProtocol {
    /// The default HTTP request headers for the environment.
    var headers: ReaquestHeaders? { get }

    /// The base URL of the environment.
    var baseURL: String { get }
}

/// Environments enum.
enum APIEnvironment: EnvironmentProtocol {
    /// The development environment.
    case development
    /// The production environment.
    case production

    /// The default HTTP request headers for the given environment.
    var headers: ReaquestHeaders? {
        switch self {
        case .development:
            return [
                "Content-Type": "application/json",
                "Authorization": Common.developmentBearerAuthorization
            ]
        case .production:
            return [
                "Content-Type": "application/json",
                "Authorization": Common.productionBearerAuthorization
            ]
        }
    }

    /// The base URL of the given environment.
    var baseURL: String {
        switch self {
        case .development:
            return Common.developmentBaseURL
        case .production:
            return Common.productionBaseURL
        }
    }
}
