//
//  EnvironmentProvider.swift
//  EnvironmentProvider
//
//  Created by Renato Stauffer on 17.09.21.
//

import Foundation

public class EnvironmentProvider {
    
    public static let shared = EnvironmentProvider()
    
    private var endpoints: [Endpoint] = []
    private var environment: Environment?
    
    init() {}
    
    public func setup(endpoints: [Endpoint], environment: Environment) {
        self.endpoints = endpoints
        self.environment = environment
    }
    
    public func setEnvironment(_ environment: Environment) {
        self.environment = environment
    }
    
    public func getEndpoint(for identifier: String) -> Endpoint? {
        let endpoint = endpoints.first { endpoint in
            endpoint.identifier == identifier
        }
        return endpoint
    }
    
    public func getUrl(for identifier: String) -> URL {
        
        guard let endpoint = getEndpoint(for: identifier) else {
            fatalError("Endpoint not available")
        }
        
        guard let environment = environment else {
            fatalError("Environment not set!")
        }

        let path = endpoint.getPath(for: environment)
        
        let url = URL(string: path)!
        return url
    }
}
