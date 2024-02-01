//
//  RegistrationView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/28/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            AppIconView()
            
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .modifier(ThreadsTFViewModifier())
                
                TextField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTFViewModifier())
                
                TextField("Enter your full name", text: $viewModel.fullname)
                    .modifier(ThreadsTFViewModifier())
                
                TextField("Enter your username", text: $viewModel.username)
                    .modifier(ThreadsTFViewModifier())
            }
            
            Button(action: {
                Task { try await viewModel.createUser() }
            }, label: {
                ActionButtonView(action: .signUp)
                    .padding(.vertical)
            })
            
            Spacer()
            
            Divider()
            
            Button(action: {
                dismiss()
            }, label: {
                FooterLinkView(action: .signIn)
            })
        }
    }
}

#Preview {
    RegistrationView()
}
