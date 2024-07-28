//
//  HTTPClient.swift
//  HTTPClient
//
//  Created by Renato Stauffer on 17.09.21.
//

import Foundation

public protocol HTTPClient {
    func performRequest<Response: Decodable>(_ router: Router) async throws -> Response
}

public struct HTTPClientError: Error {
    let statusCode: Int
    let underlyingError: Error?
}

public class DefaultHTTPClient: HTTPClient {
    
    public static let shared = DefaultHTTPClient()
    
    private static var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    private let errorDomain = "DefaultHTTPClientDomain"
    
    var interceptors = [Interceptor]()
    
    private var session: URLSession = {
        let config = DefaultHTTPClient.configuration
        return URLSession(configuration: config)
    }()
    
    private init() {}
    
    public func addInterceptor(_ interceptor: Interceptor) {
        interceptors.append(interceptor)
    }
    
    public static func setup(configuration: URLSessionConfiguration, decoder: JSONDecoder = JSONDecoder()) {
        self.configuration = configuration
        defaultDecoder = decoder
    }
    
    static var defaultDecoder = JSONDecoder()
    
    public func performRequest<Response: Decodable>(_ router: Router) async throws -> Response {
        
        var request = router.urlRequest
        
        for interceptor in interceptors {
            interceptor.intercept(&request)
        }
        
        printRequest(request: request)
        
        let result = try await session.data(for: request, delegate: nil)
        let data = result.0
        
        guard let response = result.1 as? HTTPURLResponse else {
            throw HTTPClientError(statusCode: 500, underlyingError: nil)
        }
        
        printResponse(response, data: data)
        
        guard response.isOK else {
            let nsError = NSError(domain: errorDomain, code: response.statusCode, userInfo: nil)
            throw HTTPClientError(statusCode: response.statusCode, underlyingError: nsError)
        }
        
        do {
            let decoded = try DefaultHTTPClient.defaultDecoder.decode(Response.self, from: data)
            return decoded
        } catch let error {
            throw HTTPClientError(statusCode: response.statusCode, underlyingError: error)
        }
    }
    
    private func printResponse(_ response: HTTPURLResponse, data: Data) {
        debugPrint("---------Response-------")
        debugPrint(response)
        debugPrint(String(data: data, encoding: String.Encoding.utf8) ?? "")
        debugPrint("---------Response End-------")
    }
    
    private func printRequest(request: URLRequest) {
        
        #if DEBUG
            debugPrint("---------Request-------")
            debugPrint("Method: \(request.httpMethod ?? "")")
            debugPrint("URL: \(request.url?.absoluteString ?? "")")
        
        guard let body = request.httpBody else {
            debugPrint("---------Request End-------")
            return
        }
        
        debugPrint(String(data: body, encoding: String.Encoding.utf8) ?? "")
        debugPrint("---------Request End-------")

        #endif
    }
}
