//
//  SignUpViewModel.swift
//  Login
//
//  Created by Diggo Silva on 16/07/24.
//

import Foundation

class SignUpViewModel {
    private var user: User
    private let repository = Repository()

    init(user: User = User(email: "", password: "", confirmPassword: "", name: "")) {
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

    func isConfirmPasswordValid(_ confirmPassword: String?) -> Bool {
        guard let confirmPassword = confirmPassword else { return false }

        return confirmPassword == user.password
    }

    func isNameValid(_ name: String) -> Bool {
        let nameRegex = "^[a-zA-Z]+( [a-zA-Z]+)*$" // Expressão regular para verificar letras e espaços apenas entre palavras
        let nameValid = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return nameValid.evaluate(with: name)
    }

    func saveUserData(name: String, completion: @escaping(Bool) -> Void) {
        user.name = name

        repository.save(user: user) {
            print("DEBUG: Usuário cadastrado -> EMAIL: \(self.user.email), SENHA: \(self.user.password), CONFIRMA SENHA: \(self.user.confirmPassword), NOME: \(self.user.name)")
            completion(true)
        } onError: {
            print("DEBUG: Falha ao salvar usuário.")
            completion(false)
        }
    }
}
