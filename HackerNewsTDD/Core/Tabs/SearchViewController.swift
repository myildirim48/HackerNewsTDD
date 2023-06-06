//
//  SearchViewController.swift
//  HackerNewsTDD
//
//  Created by YILDIRIM on 5.06.2023.
//

import UIKit

class SearchViewController: UIViewController {
    //MARK: - Properties
    let tableView = UITableView()
    var articles = [Article]()
    let searchController = UISearchController(searchResultsController: SearchResultViewController())
    
    //MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        configureNavbar()
        configureSearchController()
    }
    
    //MARK: - Helpers
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
    }
    private func configureNavbar() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Search"
        tableView.delegate = self
        tableView.dataSource = self
    }
}
//MARK: - TableView Delegate - Datasource
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
//MARK: - UISearch results
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
