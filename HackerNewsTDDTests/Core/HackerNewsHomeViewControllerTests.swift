//
//  HackerNewsHomeViewControllerTests.swift
//  HackerNewsHomeViewControllerTests
//
//  Created by YILDIRIM on 3.06.2023.
//

import XCTest
@testable import HackerNewsTDD

final class HackerNewsHomeViewControllerTests: XCTestCase {

    var sut: HomeViewController!
    
    override func setUp() {
        super.setUp()
        let jsonFile = "MultiJSONResponse"
        let networkManager = MockNetworkManager(jsonFile: jsonFile)
        sut = HomeViewController(networkManager: networkManager)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func createArticleArrayOfLength(_ length: Int) -> [Article] {
        var newArticles = [Article]()
        for _ in 0..<length {
            
            let newArticle = Article(title: "hil", author: nil, points: nil, objectID: nil, url: nil)
            newArticles.append(newArticle)
        }
        return newArticles
    }
    
    func test_DidsetTitleForVC() {
//        When
        sut.loadViewIfNeeded()
        let title = sut.navigationItem.title
//        Given
        XCTAssertEqual(title, "HackerNews")
    }
    
    func test_DidConfgiureTableViewDatasourceAndDelegate() {
//        When
        sut.loadViewIfNeeded()
//        Given
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func test_tableViewShouldBeEmpty() {

//        When
        sut.articles = createArticleArrayOfLength(0)
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
   
    func test_tableViewHasOneItem() {
//        Given
        let articles = createArticleArrayOfLength(1)
        sut.articles = articles
        
//        When
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_tableViewHasManyItem() {
//        Given
        let articles = createArticleArrayOfLength(5)
        
//        When
        sut.articles = articles
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), articles.count)
    }
    
}
