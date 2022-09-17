//
//  ViewController.swift
//  Multiply Numbers
//
//  Created by Chang Xu on 2022/9/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFirstNumber: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var txtSecondNumber: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func multiplyFunction(_ sender: Any) {
        let firstNumber = Int(txtFirstNumber.text ?? "0") ?? 0
        let secondNumber = Int(txtSecondNumber.text ?? "0") ?? 0
        let product = firstNumber * secondNumber
        lblResult.text = "\(product)"
    }
    
}

