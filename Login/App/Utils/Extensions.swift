//
//  Extensions.swift
//  Login
//
//  Created by Diggo Silva on 09/07/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach({ addSubview($0.self) })
    }
}
