//
//  ProfileThreadFilter.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/30/24.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads:
            "Threads"
        case .replies:
            "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
