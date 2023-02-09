//
//  MyError.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 08.02.2023.
//

import Foundation

enum MyError: LocalizedError {
    case urlError
    case unknownError
    case parseError
    case customError(error: String)
    
    var errorDescription: String {
        switch self {
        case .urlError:
            return "Ошибка при отправке запроса"
        case .unknownError:
            return "Неизвестная ошибка"
        case .parseError:
            return "Ошибка при обработке запроса"
        case let .customError(error):
            return error
        }
    }
}
