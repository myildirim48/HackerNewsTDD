//
//  FavoritesViewControllerTests.swift
//  HackerNewsTDDTests
//
//  Created by YILDIRIM on 5.06.2023.
//

import XCTest
@testable import HackerNewsTDD

final class FavoritesViewControllerTests: XCTestCase {
    
    func test_wasTitleConfigured() {
//        Given
        let sut = FavoritesViewController()
//        When
        sut.loadViewIfNeeded()
//        Then
        XCTAssertEqual(sut.navigationItem.title, "Favorites")
    }
}
