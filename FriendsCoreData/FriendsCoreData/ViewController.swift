//
//  ViewController.swift
//  FriendsCoreData
//
//  Created by Rinni Swift on 4/20/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableview: UITableView!
    
    // MARK: - Variables
    var names: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell") as! FriendTableViewCell
        return cell
    }
    
    
}

