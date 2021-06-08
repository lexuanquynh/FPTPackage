//
//  LoginUseCase.swift
//  FPTBaseFramework
//
//  Created by xuanquynhle on 2021/06/05.
//

import Foundation


protocol LoginUseCase {
    /// login request
    /// - Parameters:
    ///   - username: username description
    ///   - password: password description
    ///   - completion: completion login model or error
    func login(username: String, password: String, _ completion : @escaping(Result<LoginModel, APIError>) -> Void)
}
