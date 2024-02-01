//
//  LoginViewModel.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 2/1/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        // TODO: Refactor this to have similar errors as registration
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
