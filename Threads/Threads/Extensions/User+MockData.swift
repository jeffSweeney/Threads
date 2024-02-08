//
//  User+MockData.swift
//  Threads
//
//  Created by Jeffrey Sweeney on 2/8/24.
//

import Foundation

extension User {
    static let MOCK_USERS = [
        User(id: "ID123", fullname: "Some Test User Sr", email: "stus@test.com", username: "user_sometest_sr"),
        User(id: "ID234", fullname: "Some Test User Jr", email: "stuj@test.com", username: "user_sometest_jr"),
        User(id: "ID345", fullname: "Different Test User Sr", email: "dtus@test.com", username: "user_differenttest_sr"),
        User(id: "ID456", fullname: "Different Test User Jr", email: "dtuj@test.com", username: "user_differenttest_jr"),
        User(id: "ID567", fullname: "A Test User Sr", email: "atus@test.com", username: "user_atest_sr"),
        User(id: "ID678", fullname: "A Test User Jr", email: "atuj@test.com", username: "user_atest_jr")
    ]
    static let MOCK_USER = User(id: "ID123", fullname: "The Test User", email: "thetestuser@test.com", username: "user_test_the")
    
}
