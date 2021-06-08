//
//  LoginModel.swift
//  FPTBaseFramework
//
//  Created by xuanquynhle on 2021/06/05.
//

import Foundation

public struct LoginModel: Codable {
    public var success: Bool?
    public var message: String?

    public enum CodingKeys: String, CodingKey {
        case success
        case message
    }
}
