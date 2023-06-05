//
//  MainTabBarControllerTests.swift
//  HackerNewsTDDTests
//
//  Created by YILDIRIM on 5.06.2023.
//

import XCTest
@testable import HackerNewsTDD

final class MainTabBarControllerTests: XCTestCase {

    func test_didTabBarSetupViewController() {
//        Given
        let sut = MainTabBarController(networkManager: MockNetworkManager(jsonFile: ""))
//        When
        sut.loadViewIfNeeded()
        guard let viewControllers = sut.viewControllers else {
            XCTFail("No viewcontrollers were found in array.")
            return
        }
//        Then
        XCTAssertEqual(viewControllers.count, 3)
    }
}
