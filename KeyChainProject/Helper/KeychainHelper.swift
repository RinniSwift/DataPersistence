//
//  KeychainHelper.swift
//  KeyChainProject
//
//  Created by Rinni Swift on 4/10/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import Foundation
import KeychainSwift

class Keychain {
    
    private var keychain = KeychainSwift()
    
    func setString(item: String, key: String, synced: Bool? = false) {
        keychain.synchronizable = synced!
        keychain.set(item, forKey: key)
    }
    
    func setBool(item: Bool, key: String, synced: Bool? = false) {
        keychain.synchronizable = synced!
        keychain.set(item, forKey: key)
    }
    
    func setData(item: Data, key: String, synced: Bool? = false) {
        keychain.synchronizable = synced!
        keychain.set(item, forKey: key)
    }
    
    func getString(forKey: String) -> String? {
        return keychain.get(forKey)
    }
    
    func getBool(forKey: String) -> Bool? {
        return keychain.getBool(forKey)
    }
    
    func getData(forKey: String) -> Data? {
        return keychain.getData(forKey)
    }
    
    func delete(forKey: String) {
        keychain.delete(forKey)
    }
}
