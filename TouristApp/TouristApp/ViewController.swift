//
//  ViewController.swift
//  TouristApp
//
//  Created by 许畅 on 2022/10/3.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let TouristPlacesNames = ["zhangjiajie", "tianshan", "forbiddenCity", "dunhuang", "budalagong"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TouristPlacesNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TouristCell", owner: self)?.first as! TouristCell
        cell.imgTourist.image = UIImage(named: TouristPlacesNames[indexPath.row])
        cell.lblTourist.text = TouristPlacesNames[indexPath.row]
        return cell
    }
    


}

