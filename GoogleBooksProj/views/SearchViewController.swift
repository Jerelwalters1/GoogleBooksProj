//
//  SearchViewController.swift
//  GoogleBooksProj
//
//  Created by Consultant on 4/12/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTable: UITableView!
    
    
    
    let searchController = UISearchController(searchResultsController: nil)
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       createSearchBar()
       viewModel.delegate = self
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        searchController.isActive = false
        searchController.definesPresentationContext = true
        
        
    }

   

    func createSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "search books..."
     
    }
  
}





extension SearchViewController: UITableViewDelegate{
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let book  = viewModel.myBooks[indexPath.row]
        viewModel.currentBook = book
        
        let bkDetailVC = storyboard?.instantiateViewController(withIdentifier: "BookDetailViewController") as! BookDetailViewController
        
        bkDetailVC.viewModel = viewModel
        
        self.navigationController?.pushViewController(bkDetailVC, animated: true)
        
    }
}
extension SearchViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.myBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let bookCell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
        
        let book = viewModel.myBooks[indexPath.row]

        bookCell.configureCell(with: book)
        
        return bookCell
    }
    
    
    
    
    
}
extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        
        let searchText = searchController.searchBar.text!.replacingOccurrences(of: " ", with: "")
        
        viewModel.get(books: searchText)
    }

}
extension SearchViewController: ViewModelDelegate{
   
    func updateView() {
        
        DispatchQueue.main.async {
            self.searchTable.reloadData()
        }
        
    }


}
