//
//  FPTFramework.swift.swift
//  FPTBaseFramework
//
//  Created by xuanquynhle on 2021/06/07.
//

import Foundation

// The Method in framework define here
public class FPTFramework {
    public enum LoginType {
        case facebook
        case google
        case instagram
    }

    // MARK: - Properties
    private static var sharedNetworkManager: FPTFramework = {
        let networkManager = FPTFramework()

        // Configuration
        return networkManager
    }()

    // Initialization
    private init() {

    }

    // MARK: - Accessors
    public class func shared() -> FPTFramework {
        return sharedNetworkManager
    }

    /// Configure
    public func configure() {
        // Read anything from plist
        self.readPropertyList()
    }

    /// ReadPropertyList
    func readPropertyList() {
        var propertyListFormat =  PropertyListSerialization.PropertyListFormat.xml //Format of the Property List.
        var plistData: [String: AnyObject] = [:] //Our data
        let plistPath: String? = Bundle.main.path(forResource: "FPTConfig", ofType: "plist")! //the path of the data
        let plistXML = FileManager.default.contents(atPath: plistPath!)!
        do {
            // Convert the data to a dictionary and handle errors.
            plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &propertyListFormat) as! [String: AnyObject]
            // Read property from plist file
            if let productionBearerAuthorization = plistData["productionBearerAuthorization"] as? String {
                Common.productionBearerAuthorization = productionBearerAuthorization
            }
            if let developmentBearerAuthorization = plistData["developmentBearerAuthorization"] as? String {
                Common.developmentBearerAuthorization = developmentBearerAuthorization
            }
            if let productionBaseURL = plistData["productionBaseURL"] as? String {
                Common.productionBaseURL = productionBaseURL
            }
            if let developmentBaseURL = plistData["developmentBaseURL"] as? String {
                Common.developmentBaseURL = developmentBaseURL
            }
        } catch {
            // Show error
            print("Error reading plist: \(error), format: \(propertyListFormat)")
        }
    }

    /// Login with username & password
    /// - Parameters:
    ///   - username: username to login
    ///   - password: password to login
    ///   - completion: completion response from server or error
    public func login(username: String, password: String, _ completion: @escaping(Result<LoginModel, APIError>) -> Void) {
        let loginViewModel = LoginViewModel()
        loginViewModel.login(username: username, password: password) { result in
            completion(result)
        }
    }

    /// login social
    /// - Parameters:
    ///   - accessToken: accessToken from social framework
    ///   - type: type maybe facebook, google, or instagram
    ///   - completion: completion response from server or error
    public func loginSocial(accessToken: String, type: LoginType, _ completion: @escaping(Result<LoginModel, APIError>) -> Void) {
        // Need define here...
        switch type {
        case .facebook:
            print("need handle here")
        case .google:
            print("need handle here")
        case .instagram:
            print("need handle here")
        }
    }
}
