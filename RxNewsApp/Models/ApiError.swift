//
//  ApiError.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 08.02.2023.
//

import Foundation

struct ApiError: Decodable {
    let code: String
    let message: String
}
