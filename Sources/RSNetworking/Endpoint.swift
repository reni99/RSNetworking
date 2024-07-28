//
//  Endpoint.swift
//  Endpoint
//
//  Created by Renato Stauffer on 17.09.21.
//

import Foundation

public protocol Endpoint {
    func getPath(for environment: Environment) -> String
    var identifier: String { get }
}
