//
//  Book.swift
//  GoogleBooksProj
//
//  Created by Consultant on 4/12/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import Foundation



enum CustomError: Error {
    case missing(String)
}



class Book: Decodable{
    
    var author: String
    var date: String!
    var title: String
    var thumbnail: String!
    
    init?(json: [String:Any]) throws {
        
    
        guard let volumeInfo =  json["volumeInfo"] as? [String:Any] else {throw CustomError.missing("volumeInfo is missing")}
    
        guard let authors = volumeInfo["authors"] as? [String] else {throw  CustomError.missing("missing authors")}
        
        guard let imageLinks = volumeInfo["imageLinks"] as? [String:String] else {throw CustomError.missing("imageLinks is missing")}
  
        self.author = authors[0] 
        self.date = volumeInfo["publishedDate"] as? String
        self.title = volumeInfo["title"] as! String
        self.thumbnail = imageLinks["thumbnail"]
        
    }
    
    
   
}
