//
//  DetailViewController.swift
//  finalStock
//
//  Created by 许畅 on 2022/12/10.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var name = String()
    var price = String()
    var symbol = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = "Company Name: " + name
        lblPrice.text = "Company Price: " + price
        lblSymbol.text = "Company Symbol: " + symbol
        
    }
}
