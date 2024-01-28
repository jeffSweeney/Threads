//
//  LoginView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/28/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                AppIconView()
                
                VStack {
                    TextField("Enter your email", text: $email)
                        .modifier(ThreadsTFViewModifier())
                    
                    SecureField("Enter your password", text: $password)
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
                    
                }, label: {
                    ActionButtonView(action: .login)
                })
                
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    Text("Registration <TODO: VIEW>")
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
