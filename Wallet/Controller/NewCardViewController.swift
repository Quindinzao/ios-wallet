//
//  NewCardViewController.swift
//  Wallet
//
//  Created by João Victor Fernandes on 24/04/25.
//

import UIKit

class NewCardViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var nameTextInput: TextInputView!
    @IBOutlet weak var cardNumberTextInput: TextInputView!
    @IBOutlet weak var expiresEndTextField: TextInputView!
    @IBOutlet weak var cvvTextField: TextInputView!

    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.configureHeader(title: "Add New Card", isHidden: false)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
