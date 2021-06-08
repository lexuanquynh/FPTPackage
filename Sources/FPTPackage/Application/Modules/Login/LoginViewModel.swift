//
//  LoginViewModel.swift
//  FPTBaseFramework
//
//  Created by xuanquynhle on 2021/06/05.
//

import Foundation

class LoginViewModel {
    private let useCase: LoginUseCase!
    private let networkLoginUseCaseProvider: NetworkLoginUseCaseProvider!

    init() {
        self.networkLoginUseCaseProvider = NetworkLoginUseCaseProvider()
        self.useCase = self.networkLoginUseCaseProvider.makeLoginUseCase()
    }

    /// login API
    /// - Parameters:
    ///   - username: username to login
    ///   - password: password to login
    ///   - completion: completion response from server
    func login(username: String, password: String, _ completion : @escaping(Result<LoginModel, APIError>) -> Void) {
        self.useCase.login(username: username, password: password) { response in
            completion(response)
        }
    }
}
