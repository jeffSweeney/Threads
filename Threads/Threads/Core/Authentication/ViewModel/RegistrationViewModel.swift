//
//  RegistrationViewModel.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/31/24.
//

import Foundation

struct CreateUserError: Identifiable {
    let id = UUID()
    let error: String
}

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    @Published var creationError: CreateUserError? = nil
    
    @MainActor
    func createUser() async {
        do {
            try await AuthService.shared.createUser(withEmail: email,
                                                    password: password,
                                                    fullname: fullname,
                                                    username: username)
        } catch {
            creationError = CreateUserError(error: error.localizedDescription)
        }
    }
    
    func signupEligible() -> Bool {
        return !email.isEmpty
                && !password.isEmpty
                && !fullname.isEmpty
                && !username.isEmpty
    }
}
