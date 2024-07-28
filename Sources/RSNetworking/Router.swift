//
//  Router.swift
//  Router
//
//  Created by Renato Stauffer on 17.09.21.
//

import Foundation

public protocol Router {
    var method: HTTPMethod { get }
    var endpoint: Endpoint { get }
    var path: String { get }
    var urlRequest: URLRequest { get }
}

public extension Router {
    
    func createRequest(forEndpoint endpoint: Endpoint) -> URLRequest {
        let url = EnvironmentProvider.shared.getUrl(for: endpoint.identifier)
        var request = URLRequest(url: url.appendingPathComponent(self.path))
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
}
