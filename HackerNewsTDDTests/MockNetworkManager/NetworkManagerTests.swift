//
//  NetworkManagerTests.swift
//  HackerNewsTDDTests
//
//  Created by YILDIRIM on 5.06.2023.
//

import XCTest
@testable import HackerNewsTDD

final class NetworkManagerTests: XCTestCase {
    
    var sut: MockNetworkManager!
    override func setUp() {
        super.setUp()
        sut = MockNetworkManager()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    func test_wasNetworkManagerRequestNotNil() async {
//        Given
      
//        When
        let results = try? await sut.fetchHomeViewArticles()
//        Then
        XCTAssertNotNil(results)
    }
    
    func test_didNetworkManagerFetchAllArticles() async {
//        Given
      
//        When
        let results = try? await sut.fetchHomeViewArticles()
//        Then
        XCTAssertEqual(results?.count, 19)
    }
    
    func test_didNetworkManagerFetchSingleArticle() async {
        
  //        When
          let results = try? await sut.fetchSingleArticle()
  //        Then
          XCTAssertEqual(results?.count, 1)
    }
    
    func test_isFetchedArticleAccurate() async {
//        Given
//        When
        let results = try? await sut.fetchSingleArticle()
        guard let results, let article = results.first else {
            XCTFail("Expected single article from network call.")
            return
        }
//        Then
        XCTAssertEqual(article.title, "Show HN: Rarbg on IPFS")
        XCTAssertEqual(article.url, "https://www.google.com/")
        XCTAssertEqual(article.author, "rarbgipfs")
        XCTAssertEqual(article.points, 578)
        XCTAssertEqual(article.objectID, "36186185")
    }
    
    func test_didInvalidJSONResponseFail() async {
//        Given
//        When
        let results = try? await sut.fetchInvalidArticle()
//        Then
        XCTAssertNil(results)
    }
}
