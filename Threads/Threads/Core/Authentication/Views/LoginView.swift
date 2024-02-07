//
//  LoginView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/28/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                AppIconView()
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .modifier(ThreadsTFViewModifier())
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .textInputAutocapitalization(.never)
                        .modifier(ThreadsTFViewModifier())
                }
                
                NavigationLink {
                    Text("Forgot Password <TODO: VIEW>?")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundStyle(.black)
                }
                .padding(.vertical)
                .padding(.trailing, 28)

                
                Button(action: {
                    Task { try await viewModel.login() }
                }, label: {
                    ActionButtonView(action: .login, actionable: true)
                })
                
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    FooterLinkView(action: .signUp)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
