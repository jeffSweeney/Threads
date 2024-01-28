//
//  AppIconView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/28/24.
//

import SwiftUI

struct AppIconView: View {
    var body: some View {
        Image("threads-app-icon")
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
            .padding()
    }
}

#Preview {
    AppIconView()
}
