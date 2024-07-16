//
//  SignUpViewController.swift
//  Login
//
//  Created by Diggo Silva on 10/07/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private var signUpView = SignUpView()

        override func loadView() {
            super.loadView()
            view = signUpView
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            setNavBar()
            setDelegatesAndDataSources()
        }

        private func setNavBar() {
            title = "Cadastro"
        }

        private func setDelegatesAndDataSources() {
            signUpView.delegate = self
        }

        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    }

extension SignUpViewController: SignUpViewDelegate {
    func eyeImageButtonTapped() {
        signUpView.isVisible.toggle()
        signUpView.passwordTF.isSecureTextEntry.toggle()
        signUpView.confirmPasswordTF.isSecureTextEntry.toggle()
        
        if signUpView.isVisible {
            signUpView.eyePasswordButton.setImage(UIImage(systemName: "eye")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
            signUpView.eyeConfirmPasswordButton.setImage(UIImage(systemName: "eye")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        } else {
            signUpView.eyePasswordButton.setImage(UIImage(systemName: "eye.slash")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
            signUpView.eyeConfirmPasswordButton.setImage(UIImage(systemName: "eye.slash")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
    func signUpButtonTapped() {
        
    }
    
    func alreadyHaveAnAccountButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
        
    }
}
