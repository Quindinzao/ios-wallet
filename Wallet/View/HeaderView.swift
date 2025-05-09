//
//  HeaderView.swift
//  Wallet
//
//  Created by João Victor Fernandes on 06/05/25.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func didTapBackButton()
}

class HeaderView: UIView {
    private var titleHeader = UILabel()
    private var imageHeader = UIButton()
    weak var delegate: HeaderViewDelegate?

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
        imageHeader.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        imageHeader.tintColor = UIColor(named: "color")
        imageHeader.translatesAutoresizingMaskIntoConstraints = false
        imageHeader.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        self.addSubview(imageHeader)

        // Title configuration
        titleHeader.font = UIFont(name: "Nunito-Regular", size: 18)
        titleHeader.textColor = UIColor(named: "color")
        titleHeader.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleHeader)

        // Constraints
        NSLayoutConstraint.activate([
            imageHeader.widthAnchor.constraint(equalToConstant: 32),
            imageHeader.heightAnchor.constraint(equalToConstant: 32),
            imageHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageHeader.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            titleHeader.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func configureHeader(
        title: String,
        isHidden: Bool
    ) {
        titleHeader.text = title
        imageHeader.isHidden = isHidden
        
        if isHidden {
            NSLayoutConstraint.activate([
                titleHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                titleHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        }
    }
    
    @objc func handleBackButton() {
        delegate?.didTapBackButton()
    }
}
