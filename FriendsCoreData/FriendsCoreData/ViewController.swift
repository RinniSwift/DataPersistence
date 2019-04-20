//
//  ViewController.swift
//  FriendsCoreData
//
//  Created by Rinni Swift on 4/20/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    var names: [Friend] = []

    // MARK: - Outlets
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        
        for item in CoreDataHelper.retrieveFriends() {
            names.append(item)
        }
    }
    
    // MARK: - Actions
    @IBAction func addFriendButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Friend", message: "Add a name of your close friend!", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Add", style: .default) { [unowned self] action in
            guard let name = alert.textFields?.first?.text else { return }
            self.names.append(CoreDataHelper.saveFriend(name: name))
            self.tableview.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Rinni Swift"
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell") as! FriendTableViewCell
        cell.friendNameLabel.text = names[indexPath.row].value(forKey: "name") as? String
        return cell
    }
}

