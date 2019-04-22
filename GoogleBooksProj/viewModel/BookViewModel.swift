//
//  BookViewModel.swift
//  GoogleBooksProj
//
//  Created by Consultant on 4/21/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import Foundation
    
protocol ViewModelDelegate: class {
    func updateView()
}

class ViewModel {
    
    weak var delegate: ViewModelDelegate?
    
    
    var myBooks = [Book](){
        didSet {
            delegate?.updateView()
        }
    }
    
    var currentBook: Book!
    
    func get(books: String?){
        
        BookService.shared.getBooks(with: books) { [weak self] books in
            
                if let bks =  books {
                    self?.myBooks = bks
                }
            }
        
    }
    
    
}
