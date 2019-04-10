//
//  ViewController.swift
//  UnitTestingProj
//
//  Created by Rinni Swift on 4/8/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var textF: String = "hi"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textF = textField.text!
    }

}

