//
//  LoginViewModel.swift
//  Login
//
//  Created by Diggo Silva on 08/07/24.
//

import UIKit

enum LoginViewControllerStates {
    case waitingLog
    case logged
    case error
}

class LoginViewModel {
    var state: Bindable<LoginViewControllerStates> = Bindable(value: .waitingLog)
    var label2: String = ""
    
    func fetchData() {
        label2 = "LOGADO!!!"
        state.value = .logged
    }
}
