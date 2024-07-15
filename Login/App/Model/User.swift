//
//  User.swift
//  Login
//
//  Created by Diggo Silva on 09/07/24.
//

import Foundation

class User: Codable {
    var email: String
    var password: String
    var confirmPassword: String
    var name: String
    
    init(email: String, password: String, confirmPassword: String, name: String) {
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.name = name
    }
}
