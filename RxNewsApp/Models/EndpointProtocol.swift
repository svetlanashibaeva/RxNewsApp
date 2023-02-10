//
//  EndpointProtocol.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 08.02.2023.
//

import Foundation

protocol EndpointProtocol {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var params: [String: String] { get }
}

extension EndpointProtocol {
    
    var scheme: String {
        return "https"
    }
}
