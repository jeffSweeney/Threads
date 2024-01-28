//
//  RegistrationView.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/28/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            AppIconView()
            
            VStack {
                TextField("Enter your email", text: $email)
                    .modifier(ThreadsTFViewModifier())
                
                TextField("Enter your password", text: $password)
                    .modifier(ThreadsTFViewModifier())
                
                TextField("Enter your full name", text: $fullname)
                    .modifier(ThreadsTFViewModifier())
                
                TextField("Enter your username", text: $username)
                    .modifier(ThreadsTFViewModifier())
            }
            
            Button(action: {
                
            }, label: {
                ActionButtonView(action: .signUp)
                    .padding(.vertical)
            })
            
            Spacer()
            
            Divider()
            
            Button(action: {
                
            }, label: {
                FooterLinkView(action: .signIn)
            })
        }
    }
}

#Preview {
    RegistrationView()
}
