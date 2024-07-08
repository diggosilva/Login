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
        handleStates()
        viewModel.fetchData()
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loginView.label1.text = self.viewModel.label2
            self.loginView.label1.textColor = .systemGreen
        }
    }
    
    private func showErrorState() {
        
    }
}
