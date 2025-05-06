//
//  ViewController.swift
//  Wallet
//
//  Created by João Victor Fernandes on 24/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let button = ButtonView()
//        button.setTitle("Confirmar", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(button)
//        
//        // Action
//        button.target(forAction: #selector(navigateToNewCard(<#T##sender: UIButton##UIButton#>)), withSender: <#T##Any?#>)
//
//        // Constraints
//        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
//            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
//        ])
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
