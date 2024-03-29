//
//  AuthService.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 1/31/24.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    private init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("DEBUG: Failed to login with error \(error.localizedDescription)")
            // TODO: Refactor this to have similar errors as registration
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
        try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
    }
    
    @MainActor
    func signout() {
        try? Auth.auth().signOut() // Signs us out on backend
        self.userSession = nil // Removes session (aka signs out) on client
        UserService.shared.reset() // Sets current user to nil
    }
    
    @MainActor
    private func uploadUserData(withEmail email: String,
                                fullname: String,
                                username: String,
                                id: String) async throws {
        
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}

// MARK: - Singleton
extension AuthService {
    static let shared = AuthService()
}
