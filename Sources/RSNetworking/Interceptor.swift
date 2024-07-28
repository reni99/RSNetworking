//
//  Interceptor.swift
//  Interceptor
//
//  Created by Renato Stauffer on 17.09.21.
//

import Foundation

public protocol Interceptor {
    func intercept(_ request: inout URLRequest)
}
