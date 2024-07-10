//
//  SignUpView.swift
//  Login
//
//  Created by Diggo Silva on 10/07/24.
//

import UIKit

protocol SignUpViewDelegate: AnyObject {
    func eyeImageButtonTapped()
    func rememberButtonTapped()
    func forgotPasswordButtonTapped()
    func signUpButtonTapped()
    func alreadyHaveAnAccountButtonTapped()
}

class SignUpView: UIView {
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "pencil.and.list.clipboard")?.withTintColor(.systemIndigo, renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var bgTextFields1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var emailImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTF: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Digite seu email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.clearButtonMode = .whileEditing
        textField.becomeFirstResponder()
        //        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    lazy var bgTextFields2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var passwordImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "lock")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var passwordTF: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        //        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    
    lazy var bgTextFields3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var confirmPasswordImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "lock")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var confirmPasswordTF: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Confirmar a Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        //        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    
    lazy var bgTextFields4: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var nameImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "pencil")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameTF: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Digite seu nome", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .no
        //        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var alreadyHaveAnAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let attributedTitle = NSMutableAttributedString(string: "Já tenho uma conta?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray])
        attributedTitle.append(NSAttributedString(string: "Entrar", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(alreadyHaveAnAccountTapped), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: SignUpViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func eyeImageButtonTapped() {
        delegate?.eyeImageButtonTapped()
    }
    
    @objc func rememberButtonTapped() {
        delegate?.rememberButtonTapped()
    }
    
    @objc func forgotPasswordButtonTapped() {
        delegate?.forgotPasswordButtonTapped()
    }
    
    @objc func signUpButtonTapped() {
        delegate?.signUpButtonTapped()
    }
    
    @objc func alreadyHaveAnAccountTapped() {
        delegate?.alreadyHaveAnAccountButtonTapped()
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        backgroundColor = .systemBackground
        addSubviews([logoImage,
                     bgTextFields1, emailImage, emailTF,
                     bgTextFields2, passwordImage, passwordTF,
                     bgTextFields3, confirmPasswordImage, confirmPasswordTF,
                     bgTextFields4, nameImage, nameTF,
                     signUpButton, alreadyHaveAnAccountButton])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 150),
            logoImage.widthAnchor.constraint(equalTo: logoImage.heightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            bgTextFields1.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 30),
            bgTextFields1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bgTextFields1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bgTextFields1.heightAnchor.constraint(equalToConstant: 50),
            
            emailImage.centerYAnchor.constraint(equalTo: bgTextFields1.centerYAnchor),
            emailImage.leadingAnchor.constraint(equalTo: bgTextFields1.leadingAnchor, constant: 20),
            emailImage.widthAnchor.constraint(equalToConstant: 20),
            emailImage.heightAnchor.constraint(equalToConstant: 20),
            
            emailTF.leadingAnchor.constraint(equalTo: emailImage.trailingAnchor, constant: 5),
            emailTF.trailingAnchor.constraint(equalTo: bgTextFields1.trailingAnchor, constant: -20),
            emailTF.centerYAnchor.constraint(equalTo: emailImage.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            bgTextFields2.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 35),
            bgTextFields2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bgTextFields2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bgTextFields2.heightAnchor.constraint(equalToConstant: 50),
            
            passwordImage.centerYAnchor.constraint(equalTo: bgTextFields2.centerYAnchor),
            passwordImage.leadingAnchor.constraint(equalTo: bgTextFields2.leadingAnchor, constant: 20),
            passwordImage.widthAnchor.constraint(equalToConstant: 20),
            passwordImage.heightAnchor.constraint(equalToConstant: 20),
            
            passwordTF.leadingAnchor.constraint(equalTo: passwordImage.trailingAnchor, constant: 5),
            passwordTF.trailingAnchor.constraint(equalTo: bgTextFields2.trailingAnchor, constant: -20),
            passwordTF.centerYAnchor.constraint(equalTo: passwordImage.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            bgTextFields3.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 35),
            bgTextFields3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bgTextFields3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bgTextFields3.heightAnchor.constraint(equalToConstant: 50),
            
            confirmPasswordImage.centerYAnchor.constraint(equalTo: bgTextFields3.centerYAnchor),
            confirmPasswordImage.leadingAnchor.constraint(equalTo: bgTextFields3.leadingAnchor, constant: 20),
            confirmPasswordImage.widthAnchor.constraint(equalToConstant: 20),
            confirmPasswordImage.heightAnchor.constraint(equalToConstant: 20),
            
            confirmPasswordTF.leadingAnchor.constraint(equalTo: confirmPasswordImage.trailingAnchor, constant: 5),
            confirmPasswordTF.trailingAnchor.constraint(equalTo: bgTextFields3.trailingAnchor, constant: -20),
            confirmPasswordTF.centerYAnchor.constraint(equalTo: confirmPasswordImage.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            bgTextFields4.topAnchor.constraint(equalTo: confirmPasswordTF.bottomAnchor, constant: 35),
            bgTextFields4.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bgTextFields4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bgTextFields4.heightAnchor.constraint(equalToConstant: 50),
            
            nameImage.centerYAnchor.constraint(equalTo: bgTextFields4.centerYAnchor),
            nameImage.leadingAnchor.constraint(equalTo: bgTextFields4.leadingAnchor, constant: 20),
            nameImage.widthAnchor.constraint(equalToConstant: 20),
            nameImage.heightAnchor.constraint(equalToConstant: 20),
            
            nameTF.leadingAnchor.constraint(equalTo: nameImage.trailingAnchor, constant: 5),
            nameTF.trailingAnchor.constraint(equalTo: bgTextFields4.trailingAnchor, constant: -20),
            nameTF.centerYAnchor.constraint(equalTo: nameImage.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.bottomAnchor.constraint(equalTo: alreadyHaveAnAccountButton.topAnchor, constant: -20),
            signUpButton.leadingAnchor.constraint(equalTo: bgTextFields1.leadingAnchor, constant: 60),
            signUpButton.trailingAnchor.constraint(equalTo: bgTextFields1.trailingAnchor, constant: -60),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            
            alreadyHaveAnAccountButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150),
            alreadyHaveAnAccountButton.leadingAnchor.constraint(equalTo: bgTextFields1.leadingAnchor),
            alreadyHaveAnAccountButton.trailingAnchor.constraint(equalTo: bgTextFields1.trailingAnchor),
        ])
    }
}
