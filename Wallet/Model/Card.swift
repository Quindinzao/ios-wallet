//
//  Card.swift
//  Wallet
//
//  Created by João Victor Fernandes on 24/04/25.
//

import Foundation

class Card {
    var name: String
    var number: String
    var expirationDate: String
    var cvv: String
    
    init(name: String, number: String, expirationDate: String, cvv: String) {
        self.name = name
        self.number = number
        self.expirationDate = expirationDate
        self.cvv = cvv
    }
}
