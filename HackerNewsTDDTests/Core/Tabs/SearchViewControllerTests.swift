//
//  SearchViewControllerTests.swift
//  HackerNewsTDDTests
//
//  Created by YILDIRIM on 5.06.2023.
//

import XCTest
@testable import HackerNewsTDD
final class SearchViewControllerTests: XCTestCase {
    
    var sut: SearchViewController!
    override func setUp() {
        super.setUp()
        sut = SearchViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func createArticleArrayOfLength(_ length: Int) -> [Article] {
        var newArticles = [Article]()
        for _ in 0..<length {
            
            let newArticle = Article(title: "hil", author: nil, points: nil, objectID: nil, url: nil)
            newArticles.append(newArticle)
        }
        return newArticles
    }
    
    
    func test_wasTitleConfigured() {
        //        Given
        
        //        When
        sut.loadViewIfNeeded()
        //        Then
        XCTAssertEqual(sut.navigationItem.title, "Search")
    }
    
    func test_didConfigureTableviewDelegateAndDatasource() {
        //        when
        sut.loadViewIfNeeded()
        //        then
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func test_tableViewShouldEmpty() {
        //        given
        sut.articles = createArticleArrayOfLength(0)
        //        when
        sut.loadViewIfNeeded()
        //        then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    func test_tableviewHasOneItems() {
        //        given
        let article = createArticleArrayOfLength(1)
        sut.articles = article
        //        when
        sut.loadViewIfNeeded()
        //        then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_tableviewHasManyItems() {
        //        given
        let articles = createArticleArrayOfLength(7)
        //        when
        sut.articles = articles
        sut.loadViewIfNeeded()
        //        then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), articles.count)
    }
    
    func test_didCreateSearchControoler() {
        //        when
        sut.loadViewIfNeeded()
//        Then
        XCTAssertNotNil(sut.searchController)
        XCTAssertNotNil(sut.navigationItem.searchController)
    }
    
    func test_didconfigureSearchControllerWithResultUpdater() {
//        When
        sut.loadViewIfNeeded()
//        Then
        XCTAssertNotNil(sut.searchController.searchResultsUpdater)
    }
}
