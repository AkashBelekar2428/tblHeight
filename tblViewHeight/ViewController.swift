//
//  ViewController.swift
//  tblViewHeight
//
//  Created by Akash Belekar on 02/08/23.
//

import UIKit

struct Laptop {
    var name:String
    var price : Int
    var model : Int
    
    init(name: String, price: Int, model: Int) {
        self.name = name
        self.price = price
        self.model = model
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var tbl:UITableView!
    
    let Device = Laptop(name: "HP", price: 100, model: 2020)

    override func viewDidLoad() {
        super.viewDidLoad()
        tbl.register(UINib(nibName: "TVC", bundle: nil), forCellReuseIdentifier: "TVC")
        tbl.dataSource = self
        tbl.delegate = self
        tbl.reloadData()
    }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Device.price
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVC", for: indexPath) as! TVC
        cell.lbl.text = "Laptop Name: \(Device.name)"
        return cell
    }
}
