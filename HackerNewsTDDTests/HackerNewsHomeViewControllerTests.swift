//
//  HackerNewsHomeViewControllerTests.swift
//  HackerNewsHomeViewControllerTests
//
//  Created by YILDIRIM on 3.06.2023.
//

import XCTest
@testable import HackerNewsTDD

final class HackerNewsHomeViewControllerTests: XCTestCase {

    func test_tableViewShouldBeEmpty() {
//        Given
        let sut = HomeViewController()
        
//        When
        sut.articles = []
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
   
    func test_tableViewHasOneItem() {
//        Given
        let sut = HomeViewController()
//        When
        sut.articles.append(Article())
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_tableViewHasManyItem() {
//        Given
        let sut = HomeViewController()
//        When
        let articles = [Article(),Article(),Article(),Article(),Article()]
        sut.articles = articles
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), articles.count)
    }
    
    
}

struct Article {
    
}

class HomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var articles = [Article]()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
