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
    @IBOutlet weak var expirationDateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cardView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layoutIfNeeded()

        setupCardView()
        setupButton()
        configureLabel()
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
        cardView.layer.masksToBounds = true
    }
    
    func configureLabel() {
        let labelConfigurations: [
            (
                label: UILabel,
                fontFamily: String,
                fontSize: CGFloat,
                uppercased: Bool
            )
        ] = [
            (headerTitleLabel, "Nunito-Regular", 18, false),
            (cardTitleLabel, "Nunito-Bold", 14, false),
            (cardOwnerNameLabel, "Nunito-Regular", 14, true),
            (numberLabel, "Nunito-Regular", 8, false),
            (cardNumberLabel, "Nunito-Regular", 14, false),
            (expirationDateLabel, "Nunito-Regular", 8, false),
            (dateLabel, "Nunito-Regular", 14, false)
        ]
        
        for config in labelConfigurations {
            applyFontFamilyLabel(
                label: config.label,
                fontFamily: config.fontFamily,
                fontSize: config.fontSize,
                uppercased: config.uppercased
            )
        }
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

    @IBAction func navigateToNewCard(_ sender: UIButton) {
        sender.alpha = 0.7
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.performSegue(withIdentifier: "goToNewCard", sender: self)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToNewCard" {
//            segue.destination as! NewCardViewController
//        }
//    }

}
