//
//  ViewController.swift
//  finalStock
//
//  Created by 许畅 on 2022/12/10.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tblView: UITableView!
    var temps = [String]()
    var selectedName = String()
    var selectedSymbol = String()
    var selectedPrice = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var url = "https://us-central1-whatsapp-analytics-2de0e.cloudfunctions.net/app/allstocks"
        
        SwiftSpinner.show("Getting Stock Value")
        AF.request(url).responseJSON { responseData in
            SwiftSpinner.hide()
            if responseData.error != nil {
                print(responseData.error!)
                return
            }
            
            guard let stocks = JSON(responseData.data!).array else { return }
            
            self.temps = [String]()
            for stock in stocks {
                let stockJSON = JSON(stock)
                let name = stockJSON["CompanyName"].stringValue
                let symbol = stockJSON["Symbol"].stringValue
                let price = stockJSON["Price"].stringValue
                let str = name + "; " + symbol + "; " + price
                self.temps.append(str)
            }
            self.tblView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temps.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = temps[indexPath.row] as! String
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if (segue.identifier == "segueDetails") {
           let destVC = segue.destination as! DetailViewController
           destVC.name = selectedName
           destVC.price = selectedPrice
           destVC.symbol = selectedSymbol
       }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = indexPath.row
        print(indexPath.row)
        let selected = temps[indexPath.row]
        var selectedArr = selected.components(separatedBy: "; ")
        selectedName = selectedArr[0]
        selectedSymbol = selectedArr[1]
        selectedPrice = selectedArr[2]
        performSegue(withIdentifier: "segueDetails", sender: self)
        
    }
}

