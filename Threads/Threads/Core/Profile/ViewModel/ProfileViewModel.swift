//
//  ProfileViewModel.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 2/2/24.
//

import Combine

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: User in view model from combine is \(user)")
        }
        .store(in: &cancellables)
    }
}
