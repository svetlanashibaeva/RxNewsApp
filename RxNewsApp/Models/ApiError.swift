//
//  ApiError.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 08.02.2023.
//

import Foundation
import ObjectMapper

struct ApiError: ImmutableMappable {

    let code: String
    let message: String
    
    init(map: Map) throws {
        code = try map.value("code")
        message = try map.value("message")
    }
}
