//
//  SearchViewController.swift
//  HackerNewsTDD
//
//  Created by YILDIRIM on 5.06.2023.
//

import UIKit

class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Search"
    }
}