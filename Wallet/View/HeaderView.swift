//
//  HeaderView.swift
//  Wallet
//
//  Created by João Victor Fernandes on 06/05/25.
//

import UIKit

class HeaderView: UIView {
    private var titleHeader = UILabel()
    private var imageReturn = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeader()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHeader()
    }
    
    private func setupHeader() {
        
        // Header style
        self.backgroundColor = UIColor(named: "backgroundApp")

        // Image configuration
        imageReturn.image = UIImage(systemName: "arrow.left")
        imageReturn.tintColor = UIColor(named: "color")
        imageReturn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageReturn)

        // Titile configuration
        titleHeader.text = "Wallet"
        titleHeader.font = UIFont(name: "Nunito-Regular", size: 18)
        titleHeader.textColor = UIColor(named: "color")
        titleHeader.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleHeader)

        // Constraints
        NSLayoutConstraint.activate([
            imageReturn.widthAnchor.constraint(equalToConstant: 32),
            imageReturn.heightAnchor.constraint(equalToConstant: 32),
            imageReturn.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageReturn.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            titleHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleHeader.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])

    }
}
