//
//  KeyChainProjectTests.swift
//  KeyChainProjectTests
//
//  Created by Rinni Swift on 4/29/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import XCTest
@testable import KeyChainProject
import KeychainSwift

class KeyChainProjectTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testKeychainGet() {
        // Given an item name
        // When saving a string to keychain
        // Assert the returned value is equal to the item name
        
        let keychain = Keychain()
        keychain.setString(item: "Rinni", key: "Name")
        XCTAssertEqual(keychain.getString(forKey: "Name"), "Rinni")
    }
    
    func testKeychainDelete() {
        // Given an item name
        // When saving a string to keychain
        // Assert the returned value is equal to the item name
        
        let keychain = Keychain()
        keychain.setString(item: "Rinni", key: "Name")
        keychain.delete(forKey: "Name")
        XCTAssertEqual(keychain.getString(forKey: "Name"), nil)
    }
    
    func testKeychainUpdate() {
        let keychain = Keychain()
        keychain.setString(item: "Rinni", key: "Name")
        keychain.setString(item: "Hello", key: "Name")
        XCTAssertEqual(keychain.getString(forKey: "Name"), "Hello")
    }

}
