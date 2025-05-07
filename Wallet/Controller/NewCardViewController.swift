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
    @IBOutlet weak var textInputName: TextInputView!
    @IBOutlet weak var textInputCardNumber: TextInputView!

    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.configureHeader(title: "Add New Card", isHidden: false)
        cardView.configureCard(
            title: "Credit",
            number: "•••• •••• •••• 1234",
            name: "João V. Fernandes",
            expiry: "12/26",
            firstColor: UIColor(named: "backgroundCardFirst") ?? .blue,
            secondColor: UIColor(named: "backgroundCardSecond") ?? .purple
        )
        
        textInputName.configureTextInput(label: "Name", placeholder: "Type your name", isCapitalized: true)
        textInputName.textField.tag = 1
        textInputName.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)

        textInputCardNumber.configureTextInput(label: "Number", placeholder: "Type your card number", isCapitalized: false)
        textInputCardNumber.textField.tag = 2
        textInputCardNumber.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
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
