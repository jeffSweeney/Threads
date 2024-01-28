//
//  ThreadsTFViewModifier.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/28/24.
//

import SwiftUI

struct ThreadsTFViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)
    }
}
