//
//  ViewController.swift
//  Wallet
//
//  Created by João Victor Fernandes on 24/04/25.
//

import UIKit

class ViewController: UIViewController, NewCardViewControllerDelegate {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var addButton: UIButton!
    
    let card = Card(name: "", cardNumber: "", expiresEnd: "", cvv: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.configureHeader(title: "Wallet", isHidden: true)
        didAddCard(card)
    }
    
    func didAddCard(_ card: Card) {
        self.cardView.configureCard(
            title: "Credit",
            numberCard: card.cardNumber,
            cvv: card.cvv,
            name: card.name,
            expiresEnd: card.expiresEnd,
            firstColor: UIColor(named: "backgroundCardFirst") ?? .blue,
            secondColor: UIColor(named: "backgroundCardSecond") ?? .purple
        )
    }

    @IBAction func navigateToNewCard(_ sender: UIButton) {
        sender.alpha = 0.7
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.performSegue(withIdentifier: "goToNewCard", sender: self)
            sender.alpha = 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNewCard" {
            let destinationVC = segue.destination as! NewCardViewController
            destinationVC.delegate = self
        }
    }

}
