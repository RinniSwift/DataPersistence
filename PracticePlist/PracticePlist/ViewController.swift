//
//  ViewController.swift
//  PracticePlist
//
//  Created by Rinni Swift on 4/3/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlistHelper.resultDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataScores = PlistHelper.resultDict[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! DataTableViewCell
        cell.nameLabel.text = dataScores["name"]
        cell.scoreLabel.text = dataScores["score"]
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PlistHelper.readPlist()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        Defaults.saveToken("something")
        print(Defaults.getToken())
        Defaults.clearUserData()
        print(Defaults.getToken())
    }

}

