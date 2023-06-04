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
        sut = HomeViewController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_tableViewShouldBeEmpty() {

//        When
        sut.articles = []
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
   
    func test_tableViewHasOneItem() {
//        When
        sut.articles.append(Article())
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_tableViewHasManyItem() {

//        When
        let articles = [Article(),Article(),Article(),Article(),Article()]
        sut.articles = articles
        sut.loadViewIfNeeded()
        
//        Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), articles.count)
    }
    
    
}

