//
//  Common.swift
//  FPTBaseFramework
//
//  Created by xuanquynhle on 2021/06/07.
//

import Foundation

class Common {
    // BaseURL need read from plist
    static var developmentBaseURL = "http://api.localhost:3000/v1/"
    static var productionBaseURL = "https://api.yourapp.com/v1/"
    static var developmentBearerAuthorization = "Bearer yourBearerToken"
    static var productionBearerAuthorization = "Bearer yourBearerToken"
}
