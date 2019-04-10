//
//  UserDefaultHelper.swift
//  PracticePlist
//
//  Created by Rinni Swift on 4/8/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import Foundation
import UIKit

struct Defaults {
    
    static let token = "token"
    static let tokenKey = "tokenKey"
    
    struct Model {
        var token: String?
        
        init(token: String) {
            self.token = token
        }
    }
    
    static var saveToken = { (token: String) in
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    static var getToken = { () -> Model? in
        if let val = UserDefaults.standard.value(forKey: tokenKey) as? String {
            return Model(token: val)
        } else {
            return nil
        }
    }
    
    static func clearUserData() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
