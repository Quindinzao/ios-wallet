//
//  NewCardViewController.swift
//  Wallet
//
//  Created by João Victor Fernandes on 24/04/25.
//

import UIKit

class NewCardViewController: UIViewController, HeaderViewDelegate {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var nameTextInput: TextInputView!
    @IBOutlet weak var cardNumberTextInput: TextInputView!
    @IBOutlet weak var expiresEndTextField: TextInputView!
    @IBOutlet weak var cvvTextField: TextInputView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)

        headerView.configureHeader(title: "Add New Card", isHidden: false)
        headerView.delegate = self

        cardView.configureCard(
            title: "Credit",
            number: "",
            cvv: "",
            name: "",
            expiry: "",
            firstColor: UIColor(named: "backgroundCardFirst") ?? .blue,
            secondColor: UIColor(named: "backgroundCardSecond") ?? .purple
        )

        nameTextInput.configureTextInput(label: "Name", placeholder: "Type your name", isCapitalized: true)
        nameTextInput.textField.tag = 1
        nameTextInput.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)

        cardNumberTextInput.configureTextInput(label: "Number", placeholder: "Type your card number", isCapitalized: false)
        cardNumberTextInput.textField.tag = 2
        cardNumberTextInput.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        
        expiresEndTextField.configureTextInput(label: "Expires end", placeholder: "MM/YY", isCapitalized: false)
        expiresEndTextField.textField.tag = 3
        expiresEndTextField.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        
        cvvTextField.configureTextInput(label: "CVV", placeholder: "Type your card CVV", isCapitalized: false)
        cvvTextField.textField.tag = 4
        cvvTextField.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }

    @objc private func textDidChange(_ sender: UITextField) {
        let typedName = sender.text ?? ""
        cardView.updateText(text: typedName, tag: sender.tag)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func didTapBackButton() {
        dismiss(animated: true, completion: nil)
    }
}
