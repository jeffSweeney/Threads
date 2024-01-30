//
//  FooterLinkView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/28/24.
//

import SwiftUI

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
