//
//  CircularProfileImageView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/29/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image(systemName: "person.circle")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .foregroundStyle(.gray)
    }
}

#Preview {
    CircularProfileImageView()
}
