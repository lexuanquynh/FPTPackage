//
//  NetworkLoginUseCaseProvider.swift
//  FPTBaseFramework
//
//  Created by xuanquynhle on 2021/06/05.
//

import Foundation

class NetworkLoginUseCaseProvider: LoginUseCaseProvider {
    func makeLoginUseCase() -> LoginUseCase {
        let networkLoginUseCase = NetworkLoginUseCase()
        return networkLoginUseCase
    }
}
