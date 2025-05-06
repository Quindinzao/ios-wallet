//
//  ViewController.swift
//  Wallet
//
//  Created by João Victor Fernandes on 24/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layoutIfNeeded()

        setupButton()
        headerTitleLabel.font = UIFont(name: "Nunito-Regular", size: 18)
    }

    func setupButton() {
        addButton.titleLabel?.font = UIFont(name: "Nunito-SemiBold", size: 14)
        addButton.layer.cornerRadius = 4
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
