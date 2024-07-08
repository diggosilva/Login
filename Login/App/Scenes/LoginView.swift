//
//  LoginView.swift
//  Login
//
//  Created by Diggo Silva on 08/07/24.
//

import UIKit

class LoginView: UIView {
    lazy var label1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Espere um momento..."
        label.textColor = .systemRed
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        backgroundColor = .systemBackground
        addSubview(label1)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: centerXAnchor),
            label1.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
