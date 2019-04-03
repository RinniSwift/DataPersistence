//
//  PlistHelper.swift
//  PracticePlist
//
//  Created by Rinni Swift on 4/3/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import Foundation

class PlistHelper {
    
    static var resultDict: [[String: String]] = [[:]]
    
    class func readPlist() {
        var format = PropertyListSerialization.PropertyListFormat.xml
        var data: [String: AnyObject] = [:]
        let path: String? = Bundle.main.path(forResource: "newList", ofType: "plist")!
        let xmlContents = FileManager.default.contents(atPath: path!)!
        
        do {
            data = try PropertyListSerialization.propertyList(from: xmlContents, options: .mutableContainersAndLeaves, format: &format) as! [String: AnyObject]
            print(data)
            let dataScores: [[String: String]] = data["Scores"] as! [[String: String]]
            resultDict = dataScores
        } catch {
            print("error handling plist \(error)")
        }
    }
    
}
