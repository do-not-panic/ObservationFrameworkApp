//
//  AuthModel.swift
//  ObservationFrameworkApp
//
//  Created by ReneP on 07.11.2024.
//

import Foundation
import Observation

struct User {
    var username: String
    var password: String
}

@Observable
class AuthModel {
    
    var user = User(username: "", password: "")
    private(set) var isLoggedIn = false
    
    func login() {
        isLoggedIn = !user.username.isEmpty && !user.password.isEmpty
    }
}
