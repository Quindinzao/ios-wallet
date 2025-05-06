//
//  ButtonView.swift
//  Wallet
//
//  Created by João Victor Fernandes on 06/05/25.
//

import UIKit

class ButtonView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    func setupButton() {
        titleLabel?.font = UIFont(name: "Nunito-SemiBold", size: 14)
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor(named: "backgroundButton")
        layer.cornerRadius = 4
        heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}
