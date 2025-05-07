//
//  NewCardViewController.swift
//  Wallet
//
//  Created by João Victor Fernandes on 24/04/25.
//

import UIKit

class NewCardViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var cardView: CardView!

    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.configureHeader(title: "Add New Card", isHidden: false)
        cardView.configureCard(
            title: "Credit",
            number: "•••• •••• •••• 1234",
            name: "João V. Fernandes",
            expiry: "12/26",
            firstColor: UIColor(named: "backgroundCardFirst") ?? .blue,
            secondColor: UIColor(named: "backgroundCardSecond") ?? .purple
        )
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
