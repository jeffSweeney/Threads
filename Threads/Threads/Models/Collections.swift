//
//  Collections.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 2/8/24.
//

import Foundation

enum Collections {
    case users
    
    var name: String {
        switch self {
        case .users: "users"
        }
    }
}
