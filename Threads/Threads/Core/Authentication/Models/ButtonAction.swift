//
//  ButtonAction.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/30/24.
//

import Foundation

enum ButtonAction {
    case login
    case signUp
    
    var title: String {
        switch self {
        case .login:
            "Login"
        case .signUp:
            "Sign up"
        }
    }
}
