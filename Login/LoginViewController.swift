//
//  LoginViewController.swift
//  Login
//
//  Created by Diggo Silva on 08/07/24.
//

import UIKit

class LoginViewController: UIViewController {

    let viewModel = LoginViewModel()
    
    lazy var label1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Espere um momento..."
        label.textColor = .systemRed
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(label1)
        
        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
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
            self.label1.text = self.viewModel.label2
            self.label1.textColor = .systemGreen
        }
    }
    
    private func showErrorState() {
        
    }

}
