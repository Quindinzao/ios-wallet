//
//  CardView.swift
//  Wallet
//
//  Created by João Victor Fernandes on 27/04/25.
//

import UIKit

class CardView: UIView {
    private let cardTitleText = UILabel()
    private let cardNumberLabel = UILabel()
    private let cardNumberText = UILabel()
    private let cvvLabel = UILabel()
    private let cvvText = UILabel()
    private let nameLabel = UILabel()
    private let expiresEndLabel = UILabel()
    private let expiresEndText = UILabel()
    private let chipImageView = UIImageView()
    private let contactlessImageView = UIImageView()
    private let gradientLayer = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCard()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCard()
    }
    
    private func setupCard() {
        layer.cornerRadius = 16
        clipsToBounds = true

        // Background Gradient
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.cornerRadius = 16
        layer.insertSublayer(gradientLayer, at: 14)
        
        configureLabel()
        
        // Chip Image
        chipImageView.image = UIImage(named: "chip")
        chipImageView.contentMode = .scaleAspectFit
        chipImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(chipImageView)

        // Contactless Image
        contactlessImageView.image = UIImage(named: "contactless")
        contactlessImageView.contentMode = .scaleAspectFit
        contactlessImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contactlessImageView)

        NSLayoutConstraint.activate([
            chipImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            chipImageView.topAnchor.constraint(equalTo: cardTitleText.bottomAnchor, constant: 56),
            chipImageView.widthAnchor.constraint(equalToConstant: 56),
            chipImageView.heightAnchor.constraint(equalToConstant: 56),

            contactlessImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            contactlessImageView.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            contactlessImageView.widthAnchor.constraint(equalToConstant: 17),
            contactlessImageView.heightAnchor.constraint(equalToConstant: 28),
            
            cardTitleText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            cardTitleText.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            
            cardNumberText.leadingAnchor.constraint(equalTo: chipImageView.trailingAnchor, constant: 28),
            cardNumberText.topAnchor.constraint(equalTo: cardTitleText.bottomAnchor, constant: 64),
            cardNumberLabel.leadingAnchor.constraint(equalTo: chipImageView.trailingAnchor, constant: 28),
            cardNumberLabel.topAnchor.constraint(equalTo: cardTitleText.bottomAnchor, constant: 76),
            
            cvvText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cvvText.topAnchor.constraint(equalTo: cardTitleText.bottomAnchor, constant: 64),
            cvvLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cvvLabel.topAnchor.constraint(equalTo: cardTitleText.bottomAnchor, constant: 76),

            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),

            expiresEndText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            expiresEndText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -44),
            expiresEndLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            expiresEndLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }
    
    func configureCard(
        title: String,
        numberCard: String,
        cvv: String,
        name: String,
        expiresEnd: String,
        firstColor: UIColor,
        secondColor: UIColor
    ) {
        cardTitleText.text = title
        cardNumberText.text = "Number"
        cardNumberLabel.text = numberCard
        nameLabel.text = name.uppercased()
        cvvText.text = "CVV"
        cvvLabel.text = cvv
        expiresEndText.text = "Expires end"
        expiresEndLabel.text = expiresEnd

        gradientLayer.colors = [
            firstColor.cgColor,
            secondColor.cgColor
        ]
        gradientLayer.setNeedsDisplay()
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
            (cardTitleText, "Nunito-Bold", 14, false),
            (cardNumberLabel, "Nunito-Regular", 14, false),
            (cardNumberText, "Nunito-Bold", 8, false),
            (cvvLabel, "Nunito-Regular", 14, false),
            (cvvText, "Nunito-Bold", 8, false),
            (nameLabel, "Nunito-Regular", 14, true),
            (expiresEndLabel, "Nunito-Regular", 14, false),
            (expiresEndText, "Nunito-Regular", 8, false)
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
    
    private func applyFontFamilyLabel(
        label: UILabel,
        fontFamily: String,
        fontSize: CGFloat,
        uppercased: Bool
    ) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: fontFamily, size: fontSize)
        if uppercased {
            label.text = label.text?.uppercased()
        }
        addSubview(label)
    }

    func updateText(text: String, tag: Int) {
        switch tag {
        case 1:
            nameLabel.text = text
        case 2:
            cardNumberLabel.text = text
        case 3:
            expiresEndLabel.text = text
        case 4:
            cvvLabel.text = text
        default:
            nameLabel.text = text
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        registerForTraitChanges([UITraitUserInterfaceStyle.self], handler: { (self: Self, previousTraitCollection: UITraitCollection) in
            
            // Update card theme
            self.gradientLayer.colors = [
                UIColor(named: "backgroundCardFirst")?.cgColor ?? UIColor.clear.cgColor,
                UIColor(named: "backgroundCardSecond")?.cgColor ?? UIColor.clear.cgColor
            ]
        })
    }
}
