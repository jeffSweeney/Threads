//
//  UserService.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 2/2/24.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: User?
    
    private init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let snapshot = try await Firestore.firestore().collection(Collections.users.name).document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
        print("DEBUG: User is \(user.fullname)")
    }
    
    func reset() {
        self.currentUser = nil
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        
        let snapshot = try await Firestore.firestore().collection(Collections.users.name).getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self)})
        return users.filter { $0.id != currentUid }
    }
}

// MARK: - Singleton
extension UserService {
    static let shared = UserService()
}
