//
//  APIOperation.swift
//  FPTBaseFramework
//
//  Created by xuanquynhle on 2021/06/05.
//

import Foundation

/// API Operation class that can  execute and cancel a request.
class APIOperation: OperationProtocol {
    typealias Output = OperationResult

    /// The `URLSessionTask` to be executed/
    private var task: URLSessionTask?

    /// Instance conforming to the `RequestProtocol`.
    var request: RequestProtocol

    /// Designated initializer.
    /// - Parameter request: Instance conforming to the `RequestProtocol`.
    init(_ request: RequestProtocol) {
        self.request = request
    }

    /// Cancels the operation and the encapsulated task.
    func cancel() {
        task?.cancel()
    }

    /// Execute a request using a request dispatcher.
    /// - Parameters:
    ///   - requestDispatcher: `RequestDispatcherProtocol` object that will execute the request.
    ///   - completion: Completion block.
    func execute(in requestDispatcher: RequestDispatcherProtocol, completion: @escaping (OperationResult) -> Void) {
        task = requestDispatcher.execute(request: request, completion: { result in
            completion(result)
        })
    }
}

extension RequestProtocol {

    /// Creates a URLRequest from this instance.
    /// - Parameter environment: The environment against which the `URLRequest` must be constructed.
    /// - Returns: An optional `URLRequest`.
    func urlRequest(with environment: EnvironmentProtocol) -> URLRequest? {
        // Create the base URL.
        guard let url = url(with: environment.baseURL) else {
            return nil
        }
        // Create a request with that URL.
        var request = URLRequest(url: url)

        // Append all related properties.
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = jsonBody

        return request
    }

    /// Creates a URL with the given base URL.
    /// - Parameter baseURL: The base URL string.
    /// - Returns: An optional `URL`.
    private func url(with baseURL: String) -> URL? {
        // Create a URLComponents instance to compose the url.
        guard var urlComponents = URLComponents(string: baseURL) else {
            return nil
        }
        // Add the request path to the existing base URL path
        urlComponents.path = urlComponents.path + path
        // Add query items to the request URL
        urlComponents.queryItems = queryItems

        return urlComponents.url
    }

    /// Returns the URLRequest `URLQueryItem`
    private var queryItems: [URLQueryItem]? {
        // Chek if it is a GET method.
        guard method == .get, let parameters = parameters else {
            return nil
        }
        // Convert parameters to query items.
        return parameters.map { (key: String, value: Any?) -> URLQueryItem in
            let valueString = String(describing: value)
            return URLQueryItem(name: key, value: valueString)
        }
    }

    /// Returns the URLRequest body `Data`
    private var jsonBody: Data? {
        // The body data should be used for POST, PUT and PATCH only
        guard [.post, .put, .patch].contains(method), let parameters = parameters else {
            return nil
        }
        // Convert parameters to JSON data
        var jsonBody: Data?
        do {
            jsonBody = try JSONSerialization.data(withJSONObject: parameters,
                                                  options: .prettyPrinted)
        } catch {
            print(error)
        }
        return jsonBody
    }
}
