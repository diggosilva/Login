//
//  User.swift
//  Login
//
//  Created by Diggo Silva on 09/07/24.
//

import Foundation

class User: Codable {
    let email: String
    let password: String
    let confirmPassword: String
    let name: String
    
    init(email: String, password: String, confirmPassword: String, name: String) {
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.name = name
    }
}
