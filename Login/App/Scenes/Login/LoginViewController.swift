//
//  LoginViewController.swift
//  Login
//
//  Created by Diggo Silva on 08/07/24.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginView = LoginView()
    private let viewModel = LoginViewModel()
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDataSources()
        handleStates()
        viewModel.fetchData()
    }
    
    private func setNavBar() {
        title = "Login"
    }
    
    private func setDelegatesAndDataSources() {
        loginView.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func handleStates() {
        viewModel.state.bind { states in
            switch states {
            case .waitingLog:
                return self.showWaitingLogState()
            case .logged:
                return self.showLoggedState()
            case .error:
                return self.showErrorState()
            }
        }
    }
    
    private func showWaitingLogState() {
        
    }
    
    private func showLoggedState() {
        
    }
    
    private func showErrorState() {
        
    }
}

extension LoginViewController: LoginViewDelegate {
    func eyeImageButtonTapped() {
        loginView.isVisible.toggle()
        loginView.passwordTF.isSecureTextEntry.toggle()
        
        if loginView.isVisible {
            loginView.eyeImageButton.setImage(UIImage(systemName: "eye")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        } else {
            loginView.eyeImageButton.setImage(UIImage(systemName: "eye.slash")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
    func rememberButtonTapped() {
        loginView.isChecked.toggle()
        
        if loginView.isChecked {
            loginView.squareImageButton.setImage(UIImage(systemName: "checkmark.square")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        } else {
            loginView.squareImageButton.setImage(UIImage(systemName: "square")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
    func forgotPasswordButtonTapped() {
        print("DEBUG: Clicou no botão ESQUECEU A SENHA")
    }
    
    func enterButtonTapped() {
        print("DEBUG: Clicou no botão ENTRAR")
    }
    
    func dontHaveAnAccountTapped() {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}
