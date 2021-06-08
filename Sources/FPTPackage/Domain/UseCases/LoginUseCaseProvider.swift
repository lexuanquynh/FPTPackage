//
//  LoginUseCaseProvider.swift
//  FPTBaseFramework
//
//  Created by xuanquynhle on 2021/06/05.
//

import Foundation

protocol LoginUseCaseProvider {
    func makeLoginUseCase() -> LoginUseCase
}
