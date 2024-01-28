//
//  FooterLinkView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/28/24.
//

import SwiftUI

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

struct FooterLinkView: View {
    var action: LinkAction
    
    var body: some View {
        HStack(spacing: 4) {
            Text(action.prompt)
            
            Text(action.action)
                .fontWeight(.semibold)
        }
        .font(.footnote)
        .foregroundStyle(.black)
        .padding(.vertical, 16)
    }
}

#Preview {
    FooterLinkView(action: .signIn)
}
