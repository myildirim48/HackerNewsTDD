//
//  NetworkManagerTests.swift
//  HackerNewsTDDTests
//
//  Created by YILDIRIM on 5.06.2023.
//

import XCTest
@testable import HackerNewsTDD

final class NetworkManagerTests: XCTestCase {

    func test_wasNetworkManagerRequestNotNil() async {
//        Given
        let singleJson = "SingleJSONResponse"
        let sut = MockNetworkManager(jsonFile: singleJson)
        
//        When
        let results = try? await sut.fetchHomeViewArticles()
//        Then
        XCTAssertNotNil(results)
    }
    
    func test_didNetworkManagerFetchAllArticles() async {
//        Given
        let multiJson = "MultiJSONResponse"
        let sut = MockNetworkManager(jsonFile: multiJson)
//        When
        let results = try? await sut.fetchHomeViewArticles()
//        Then
        XCTAssertEqual(results?.count, 19)
    }
    
    func test_isFetchedArticleAccurate() async {
//        Given
        let multiJson = "MultiJSONResponse"
        let sut = MockNetworkManager(jsonFile: multiJson)
//        When
        let results = try? await sut.fetchHomeViewArticles()
        guard let results, let article = results.first else {
            XCTFail("Expected single article from network call.")
            return
        }
//        Then
        XCTAssertEqual(article.title, "Show HN: Rarbg on IPFS")
        XCTAssertEqual(article.url, "https://ipfs.io/ipfs/QmbpRxBZ5HDZDVRoeAU8xFYnoP4r5eGCxdkmfFW3JbA6mq/")
        XCTAssertEqual(article.author, "rarbgipfs")
        XCTAssertEqual(article.points, 578)
        XCTAssertEqual(article.objectID, "36186185")
    }
    
    func test_didInvalidJSONResponseFail() async {
//        Given
        let json = "InvalidJSONResponse"
        let sut = MockNetworkManager(jsonFile: json)
//        When
        let results = try? await sut.fetchHomeViewArticles()
//        Then
        XCTAssertNil(results)
    }
}
