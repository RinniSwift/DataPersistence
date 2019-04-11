//
//  ViewController.swift
//  KeyChainProject
//
//  Created by Rinni Swift on 4/10/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {
    
    // MARK: - Variables
    var keychain = KeychainSwift()
    let messageKey = "save message"
    var textSaved: String? = nil {
        didSet {
            finalMessageTextView.text = textSaved
        }
    }

    // MARK: - Outlets
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var willSyncSwitch: UISwitch!
    @IBOutlet weak var finalMessageTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        keychain.synchronizable = willSyncSwitch.isOn
        keychain.set(messageTextField.text!, forKey: messageKey)
        textSaved = keychain.get(messageKey)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        keychain.delete(messageKey)
        textSaved = ""  // or -> set the textField directly to be empty
        messageTextField.text = ""
        
    }
    
}

