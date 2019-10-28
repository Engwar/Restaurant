//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by Igor Shelginskiy on 12/14/18.
//  Copyright © 2018 Igor Shelginskiy. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    
    var menuItem: MenuItem! 

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        titleLable.text = menuItem.name
        detailLabel.text = menuItem.detailtext
        
        let priceString = String(format: "Add ($%.2f)", menuItem.price)
        addToOrderButton.setTitle(priceString, for: .normal)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func orderButtonTaped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            sender.transform = CGAffineTransform(scaleX: 3, y: 3)
            sender.transform = CGAffineTransform.identity
        }
        
        MenuController.shared.order.menuItems.append(menuItem)
    }
    
}
