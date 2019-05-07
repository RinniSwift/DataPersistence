//
//  RealmPracticeTests.swift
//  RealmPracticeTests
//
//  Created by Adriana González Martínez on 5/2/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//

import XCTest
import RealmSwift

@testable import RealmPractice

class RealmPracticeTests: XCTestCase {

    var bookStore: BookStore!
    
    override func setUp() {
        // Notice you can configure Realms before creating them. Here we use the in-memory type.
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        let realm = try! Realm()

        bookStore = BookStore()
        bookStore.realm = realm
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSaveAndGetBook() {
        
        //Given a new book with title: Jungle Book, author: Rudyard Kipling and year: 1894
         let book = bookStore.createBook("Jungle Book", author: "Rudyard Kipling", year: 1894)
        
        //When saved to the database
        bookStore.saveBook(book)

        //Then we get find it by name and make sure the year is 1894
         let foundBooks = bookStore.findBooksByTitle("Jungle Book")
         XCTAssertEqual(foundBooks.count, 1)
        
         let firstBook = foundBooks.first
         XCTAssertEqual(firstBook?.year, 1894)
    }
    

    func testSaveAndUpdateBook() {
       
        do {
            //Given a book: Hamlet, William, 1599
            let title = "Hemlet"
            let name = "William"
            let year = 1599
            
            let book = bookStore.createBook(title, author: name, year: year)
            bookStore.saveBook(book)
            
            //When updating the author to William Shakespeare
            try bookStore.updateBooks("author", currentValue: "William", updatedValue: "William Shakespeare")
            
            //Then we find it again and make sure the author's name matches the new value
            let books = bookStore.findBooksByTitle("Hemlet")
            
            XCTAssertEqual(books.first!.author, "William Shakespeare")
            
        } catch RuntimeError.NoRealmSet {
            XCTAssert(false, "No realm database was set")
        } catch {
            XCTAssert(false, "Unexpected error \(error)")
        }

       
       
    }
    
    func testDelete() {
        
        do {
            let title = "The Tree House"
            let name = "Rainbows"
            let year = 1999
            
            // create the book and save to realm
            let book = bookStore.createBook(title, author: name, year: year)
            bookStore.saveBook(book)
            
            do {
                try bookStore.deleteBook(book)
            } catch {
                XCTAssert(false, "Unexpected error \(error)")
            }

            // find and assert it to equal 0 books found
            let books = bookStore.findBooksByTitle(title)
            XCTAssertEqual(books.count, 0)
            
        } catch RuntimeError.NoRealmSet {
            XCTAssert(false, "No realm database was set")
        }
       
    }
    
}
