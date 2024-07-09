//
//  LoginView.swift
//  Login
//
//  Created by Diggo Silva on 08/07/24.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func eyeImageButtonTapped()
    func rememberButtonTapped()
    func forgotPasswordButtonTapped()
    func enterButtonTapped()
    func dontHaveAnAccountTapped()
}

class LoginView: UIView {
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "gamecontroller.fill")?.withTintColor(.systemIndigo, renderingMode: .alwaysOriginal)
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
        image.image = UIImage(systemName: "person.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTF: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Digite seu email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
//        textField.text = "diggo@ig.com"
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
        image.image = UIImage(systemName: "lock.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var passwordTF: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
//        textField.text = "123456"
        textField.isSecureTextEntry = true
        //        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    lazy var eyeImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye.slash")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(eyeImageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var squareImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(rememberButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var rememberButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Lembre-me", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(rememberButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var forgotSenhaButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueceu sua senha?", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var dontHaveAnAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let attributedTitle = NSMutableAttributedString(string: "Não tem uma conta?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray])
        attributedTitle.append(NSAttributedString(string: "Clique aqui", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(dontHaveAnAccountTapped), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: LoginViewDelegate?
    var isChecked = false
    var isVisible = false
    
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
    
    @objc func enterButtonTapped() {
        delegate?.enterButtonTapped()
    }
    
    @objc func dontHaveAnAccountTapped() {
        delegate?.dontHaveAnAccountTapped()
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        backgroundColor = .systemBackground
        addSubviews([logoImage,
                     bgTextFields1, emailImage, emailTF, bgTextFields2, passwordImage, passwordTF, eyeImageButton,
                     squareImageButton, rememberButton, forgotSenhaButton,
                     enterButton, dontHaveAnAccountButton])
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
            
            eyeImageButton.centerYAnchor.constraint(equalTo: bgTextFields2.centerYAnchor),
            eyeImageButton.trailingAnchor.constraint(equalTo: bgTextFields2.trailingAnchor, constant: -25),
            eyeImageButton.widthAnchor.constraint(equalToConstant: 25),
            eyeImageButton.heightAnchor.constraint(equalToConstant: 20),
            
            squareImageButton.centerYAnchor.constraint(equalTo: forgotSenhaButton.centerYAnchor),
            squareImageButton.leadingAnchor.constraint(equalTo: bgTextFields2.leadingAnchor, constant: 20),
            squareImageButton.widthAnchor.constraint(equalToConstant: 15),
            squareImageButton.heightAnchor.constraint(equalToConstant: 15),
            
            rememberButton.centerYAnchor.constraint(equalTo: forgotSenhaButton.centerYAnchor),
            rememberButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 20),
            rememberButton.leadingAnchor.constraint(equalTo: squareImageButton.trailingAnchor, constant: 5),
            
            forgotSenhaButton.topAnchor.constraint(equalTo: bgTextFields2.bottomAnchor, constant: 10),
            forgotSenhaButton.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            enterButton.bottomAnchor.constraint(equalTo: dontHaveAnAccountButton.topAnchor, constant: -20),
            enterButton.leadingAnchor.constraint(equalTo: bgTextFields1.leadingAnchor, constant: 60),
            enterButton.trailingAnchor.constraint(equalTo: bgTextFields1.trailingAnchor, constant: -60),
            enterButton.heightAnchor.constraint(equalToConstant: 50),
            
            dontHaveAnAccountButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150),
            dontHaveAnAccountButton.leadingAnchor.constraint(equalTo: bgTextFields1.leadingAnchor),
            dontHaveAnAccountButton.trailingAnchor.constraint(equalTo: bgTextFields1.trailingAnchor),
        ])
    }
}
