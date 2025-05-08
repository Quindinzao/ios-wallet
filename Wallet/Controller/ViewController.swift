//
//  ViewController.swift
//  Wallet
//
//  Created by João Victor Fernandes on 24/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.configureHeader(title: "Wallet", isHidden: true)
        cardView.configureCard(
            title: "Credit",
            number: "•••• •••• •••• 1234",
            cvv: "111",
            name: "João V. Fernandes",
            expiry: "12/26",
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToNewCard" {
//            segue.destination as! NewCardViewController
//        }
//    }

}
