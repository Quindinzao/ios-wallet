//
//  Card.swift
//  Wallet
//
//  Created by João Victor Fernandes on 24/04/25.
//

import Foundation

struct Card {
    var name: String
    var cardNumber: String
    var expiresEnd: String
    var cvv: String
    
    init(name: String, cardNumber: String, expiresEnd: String, cvv: String) {
        self.name = name
        self.cardNumber = cardNumber
        self.expiresEnd = expiresEnd
        self.cvv = cvv
    }
    
    func getName() -> String {
        return name
    }
    
    func getCardNumber() -> String {
        return cardNumber
    }
    
    func getExpiresEnd() -> String {
        return expiresEnd
    }
    
    func getCvv() -> String {
        return cvv
    }
}
