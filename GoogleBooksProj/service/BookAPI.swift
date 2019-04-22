//
//  BookAPI.swift
//  GoogleBooksProj
//
//  Created by Consultant on 4/12/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import Foundation



struct bookAPI {
    
    static let base = "https://www.googleapis.com/books/v1/volumes?q="
    
    
    static func bookSearchURL(from search: String) -> String{
        
       return base + search
    }
    
}

