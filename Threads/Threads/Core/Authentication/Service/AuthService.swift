//
//  AuthService.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/31/24.
//

import Firebase

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    private init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    @MainActor
    func signout() {
        try? Auth.auth().signOut() // Signs us out on backend
        self.userSession = nil // Removes session (aka signs out) on client
    }
}

extension AuthService {
    static let shared = AuthService()
}
