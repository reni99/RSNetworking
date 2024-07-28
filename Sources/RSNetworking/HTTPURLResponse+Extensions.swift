//
//  DazClient.swift
//  DazClient
//
//  Created by Renato Stauffer on 16.09.21.
//

import Foundation

extension HTTPURLResponse {
    var isOK: Bool {
        return (200...299).contains(self.statusCode)
    }
}
