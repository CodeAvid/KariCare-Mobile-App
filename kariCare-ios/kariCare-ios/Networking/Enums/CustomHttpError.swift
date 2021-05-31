//
//  CustomHttpError.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 28/05/2021.
//

import Foundation

enum CustomHttpError: Error {
    case NotJson
    case BadRequest
    case ServerError
    case Unknown(error: String)
}

extension CustomHttpError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .NotJson:
            return Constants.HttpErrorMessage.notJson
            
        case .BadRequest:
            return Constants.HttpErrorMessage.badRequest
        case .ServerError:
            return Constants.HttpErrorMessage.serverError
        case .Unknown(let error):
            return error
        }
    }
}
