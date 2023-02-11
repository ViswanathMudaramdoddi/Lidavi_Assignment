//
//  ViewController.swift
//  Lidavi_Assignment
//
//  Created by Viswanath on 10/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    var details = [Details]()
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak internal var addBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.backgroundColor = UIColor.black
        self.tabBar.isTranslucent = false
        addBtn.layer.cornerRadius = addBtn.frame.size.width / 2
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        details = DBManager.share.fetchDetails()
        tableView.reloadData()
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.backgroundColor = UIColor.black
        let allDetails = details[indexPath.row]
        cell.nameLabel.text = allDetails.name
        cell.emailLabel.text = allDetails.email
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
}

