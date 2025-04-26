//
//  ViewController.swift
//  Wallet
//
//  Created by João Victor Fernandes on 24/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var cardOwnerNameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cardView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layoutIfNeeded()

        setupCardView()
        setupButton()
        applyFontFamilyLabel(
            label: headerTitleLabel,
            fontFamily: "Nunito-Regular",
            fontSize: 18,
            uppercased: false
        )
        applyFontFamilyLabel(
            label: cardTitleLabel,
            fontFamily: "Nunito-Bold",
            fontSize: 14,
            uppercased: false
        )
        applyFontFamilyLabel(
            label: cardOwnerNameLabel,
            fontFamily: "Nunito-Regular",
            fontSize: 14,
            uppercased: true
        )
        applyFontFamilyLabel(
            label: numberLabel,
            fontFamily: "Nunito-Regular",
            fontSize: 8,
            uppercased: false
        )
        applyFontFamilyLabel(
            label: cardNumberLabel,
            fontFamily: "Nunito-Regular",
            fontSize: 14,
            uppercased: false
        )
    }
    
    func setupCardView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = cardView.bounds
        gradientLayer.colors = [
            UIColor(named: "backgroundCardFirst")?.cgColor ?? UIColor.clear.cgColor,
            UIColor(named: "backgroundCardSecond")?.cgColor ?? UIColor.clear.cgColor
        ]
        cardView.layer.addSublayer(gradientLayer)
        gradientLayer.cornerRadius = 16
    }
    
    func applyFontFamilyLabel(
        label: UILabel,
        fontFamily: String,
        fontSize: CGFloat,
        uppercased: Bool
    ) {
        label.font = UIFont(name: fontFamily, size: fontSize)
        if uppercased {
            label.text = label.text?.uppercased()
        }
    }
    
    func setupButton() {
        addButton.titleLabel?.font = UIFont(name: "Nunito-SemiBold", size: 14)
        addButton.layer.cornerRadius = 4
    }

    @IBAction func addNewCard(_ sender: UIButton) {
    }

}
