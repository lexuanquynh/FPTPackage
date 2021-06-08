//
//  NetworkLoginUseCase.swift
//  FPTBaseFramework
//
//  Created by xuanquynhle on 2021/06/05.
//

import Foundation

class NetworkLoginUseCase: LoginUseCase {
    func login(username: String, password: String, _ completion : @escaping(Result<LoginModel, APIError>) -> Void) {
        let requestDispatcher = APIRequestDispatcher(networkSession: APINetworkSession())
        let params: [String : Any] = [
           "username": username,
           "password": password
        ]

        let loginCreationRequest = LoginEnpoint.login(parameters: params)

        let loginOperation = APIOperation(loginCreationRequest)
        loginOperation.execute(in: requestDispatcher) { result in
            switch result {
            case .json(let json, _):
                guard let data = json as? Data,
                    let loginModel = try? JSONDecoder().decode(LoginModel.self, from: data) else {
                    // Decode error
                    completion(.failure(APIError.parseError("parse error!")))
                    return
                }
                completion(.success(loginModel))
                break
            case .file(_, _):
                break
            case .error(let error, _):
                if let error = error as? APIError {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.unknown))
                }

            }
          // Handle result
        }
    }
}
