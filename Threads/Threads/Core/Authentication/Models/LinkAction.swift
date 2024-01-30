//
//  LinkAction.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/30/24.
//

import Foundation

enum LinkAction {
    case signIn
    case signUp
    
    var prompt: String {
        switch self {
        case .signIn:
            "Already have an account?"
        case .signUp:
            "Don't have an account?"
        }
    }
    
    var action: String {
        switch self {
        case .signIn:
            "Sign In"
        case .signUp:
            "Sign Up"
        }
    }
}
