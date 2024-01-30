//
//  ActionButtonView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/28/24.
//

import SwiftUI

struct ActionButtonView: View {
    let action: ButtonAction
    
    var body: some View {
        Text(action.title)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 360, height: 44)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    ActionButtonView(action: .login)
}
