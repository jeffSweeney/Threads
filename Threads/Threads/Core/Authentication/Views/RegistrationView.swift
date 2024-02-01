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
                Task { await viewModel.createUser() }
            }, label: {
                ActionButtonView(action: .signUp, actionable: viewModel.signupEligible())
                    .padding(.vertical)
            })
            .disabled(!viewModel.signupEligible())
            .alert("Create User Failed",
                   isPresented: .constant(viewModel.creationError != nil),
                   presenting: viewModel.creationError) { creationError in
                Button("Retry") {
                    viewModel.creationError = nil
                }
            } message: { creationError in
                Text(creationError.error)
            }
            
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
