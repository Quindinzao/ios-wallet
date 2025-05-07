//
//  TextInputView.swift
//  Wallet
//
//  Created by João Victor Fernandes on 06/05/25.
//

import UIKit

class TextInputView: UIView {
    private let labelTextField = UILabel()
    private let textField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextInput()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextInput()
    }
    
    private func setupTextInput() {
        // Configurações do rótulo
        labelTextField.text = "Name"
        labelTextField.font = UIFont(name: "Nunito-Light", size: 12)
        labelTextField.textColor = UIColor(named: "colorLabel")
        labelTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(labelTextField)
        
        // Configurações do text field
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "colorLabel") ?? .red,
            .font: UIFont(name: "Nunito-Light", size: 14) ?? UIFont.systemFont(ofSize: 14)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: placeholderAttributes)
        textField.backgroundColor = UIColor(named: "backgroundTextInput")
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 0.7
        textField.layer.borderColor = UIColor(named: "borderTextInput")?.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        // Padding à esquerda
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always

        // Padding à direita
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.rightView = rightPaddingView
        textField.rightViewMode = .always

        addSubview(textField)
        
        // Constraints
        NSLayoutConstraint.activate([
            labelTextField.topAnchor.constraint(equalTo: topAnchor),
            labelTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: labelTextField.bottomAnchor, constant: 2),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
