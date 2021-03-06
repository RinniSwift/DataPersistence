//
//  ViewController.swift
//  RealmPractice
//
//  Created by Adriana González Martínez on 5/2/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let store = BookStore()
        let realm = try! Realm()
        store.realm = realm
        
        //TODO: Create a book
        //A Game of Thrones (A Song of Ice and Fire #1)
        //George R. R. Martin"
        //1997
        let title = "A Game of Thrones (A Song of Ice and Fire #1)"
        let author = "George R. R. Martin"
        let year = 1997
        
        //TODO: Save the book
        let gotBook = store.createBook(title, author: author, year: year)
        store.saveBook(gotBook)
        
        //TODO: Find the book by title, print the result.
        let book = store.findBooksByTitle(title)
        print(book.count)
    }


}

