//
//  SignUpViewModel.swift
//  Login
//
//  Created by Diggo Silva on 15/07/24.
//

import Foundation

class SignUpViewModel {
    private var user: User
    private let repository = Repository()
    
    init(user: User) {
        self.user = user
    }
    
    func isEmailValid(_ email: String?) -> Bool {
        guard let email = email else { return false }
        
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailValid = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        let isEmailValid = emailValid.evaluate(with: trimmedEmail)
        
        let isSameEmail = email == trimmedEmail
        
        return isEmailValid && isSameEmail
    }
    
    func isPasswordValid(_ password: String?) -> Bool {
        guard let password = password else { return false }
        
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{4,}$"
        let passwordValid = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        return passwordValid.evaluate(with: password)
    }
}
