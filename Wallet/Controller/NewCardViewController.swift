//
//  NewCardViewController.swift
//  Wallet
//
//  Created by João Victor Fernandes on 24/04/25.
//

import UIKit

protocol NewCardViewControllerDelegate: AnyObject {
    func didAddCard(_ card: Card)
}

class NewCardViewController: UIViewController, HeaderViewDelegate {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var nameTextInput: TextInputView!
    @IBOutlet weak var cardNumberTextInput: TextInputView!
    @IBOutlet weak var expiresEndTextField: TextInputView!
    @IBOutlet weak var cvvTextField: TextInputView!
    weak var delegate: NewCardViewControllerDelegate?
    
    private var card = Card(name: "", cardNumber: "", expiresEnd: "", cvv: "")

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )

        headerView.configureHeader(title: "Add New Card", isHidden: false)
        headerView.delegate = self

        updateCardView()

        nameTextInput.configureTextInput(label: "Name", placeholder: "Type your name", isCapitalized: true)
        nameTextInput.textField.tag = 1
        nameTextInput.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)

        cardNumberTextInput.configureTextInput(label: "Number", placeholder: "Type your card number", keyboardType: .numberPad)
        cardNumberTextInput.textField.tag = 2
        cardNumberTextInput.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        
        expiresEndTextField.configureTextInput(label: "Expires end", placeholder: "MM/YY", keyboardType: .numberPad)
        expiresEndTextField.textField.tag = 3
        expiresEndTextField.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        
        cvvTextField.configureTextInput(label: "CVV", placeholder: "Type your card CVV", keyboardType: .numberPad)
        cvvTextField.textField.tag = 4
        cvvTextField.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
    
    func updateCardView() {
        cardView.configureCard(
            title: "Credit",
            numberCard: card.getCardNumber(),
            cvv: card.getCvv(),
            name: card.getName(),
            expiresEnd: card.getExpiresEnd(),
            firstColor: UIColor(named: "backgroundCardFirst") ?? .blue,
            secondColor: UIColor(named: "backgroundCardSecond") ?? .purple
        )
    }

    @objc private func textDidChange(_ sender: UITextField) {
        guard let text = sender.text else { return }
        let maskedText = applyMask(to: text, tag: sender.tag)
        sender.text = maskedText
        
        switch sender.tag {
        case 1:
            card.name = maskedText
        case 2:
            card.cardNumber = maskedText
        case 3:
            card.expiresEnd = maskedText
        case 4:
            card.cvv = maskedText
        default:
            break
        }

        cardView.updateText(text: maskedText, tag: sender.tag)
        updateCardView()
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        let keyboardHeight = keyboardFrame.height
        
        if (view.frame.origin.y == 0) {
            view.frame.origin.y -= keyboardHeight / 2
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        if (view.frame.origin.y != 0) {
            view.frame.origin.y = 0
        }
    }
    
    func didTapBackButton() {
        dismiss(animated: true, completion: nil)
    }

    private func applyMask(to text: String, tag: Int) -> String {
        let digits = text.replacingOccurrences(of: "\\D", with: "", options: .regularExpression)

        switch tag {
        case 2:
            return applyNumberCardMask(digits)
        case 3:
            return applyExpiryMask(digits)
        case 4:
            return String(text.prefix(3))
        default:
            return text
        }
    }

    private func applyNumberCardMask(_ digits: String) -> String {
        var result = ""
        for (index, char) in digits.enumerated() {
            if index != 0 && index % 4 == 0 {
                result.append(" ")
            }
            result.append(char)
        }
        return String(result.prefix(19))
    }

    private func applyExpiryMask(_ digits: String) -> String {
        var result = ""
        for (index, char) in digits.enumerated() {
            if index == 2 {
                result.append("/")
            }
            result.append(char)
        }
        return String(result.prefix(5))
    }
    
    private func validateCardNumber(_ cardNumberStr: String) -> Bool {
        let formattedCardNumber = cardNumberStr.replacingOccurrences(of: " ", with: "")
        if (formattedCardNumber.count != 16) {
            return false
        }
        
        var oddPosition: [Int] = []
        var evenPosition: [Int] = []
        var oddPositionFormatted: [Int] = []

        for (position, item) in formattedCardNumber.enumerated() {
            let digit = Int(String(item))!
            if ((position + 1) % 2 == 1) {
                oddPosition.append(digit)
            } else {
                evenPosition.append(digit)
            }
        }
        
        for (_, item) in oddPosition.enumerated() {
            let digit = item * 2
            let digitHelper = String(digit).count == 1 ? String(format: "%02d", digit) : String(digit)
            
            let firstChar = Int(String(digitHelper.first!))!
            let secondChar = Int(String(digitHelper.last!))!

            oddPositionFormatted.append(firstChar)
            oddPositionFormatted.append(secondChar)
        }
    
        let sum = oddPositionFormatted.reduce(0, +) + evenPosition.reduce(0, +)
        
        return sum % 10 == 0
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveCard(_ sender: ButtonView) {
        let validateCardNumberBool = validateCardNumber(cardNumberTextInput.textField.text!)
        if validateCardNumberBool {
            let card = Card(
                name: nameTextInput.textField.text ?? "",
                cardNumber: cardNumberTextInput.textField.text ?? "",
                expiresEnd: expiresEndTextField.textField.text ?? "",
                cvv: cvvTextField.textField.text ?? ""
            )
               
           delegate?.didAddCard(card)
           dismiss(animated: true, completion: nil)
        } else {
            showAlert(title: "Oops!", message: "This is not a valid card number. Please try again.")
        }
    }
}
