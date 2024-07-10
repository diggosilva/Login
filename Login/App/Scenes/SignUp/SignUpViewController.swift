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
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
