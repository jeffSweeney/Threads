//
//  User.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 2/2/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
