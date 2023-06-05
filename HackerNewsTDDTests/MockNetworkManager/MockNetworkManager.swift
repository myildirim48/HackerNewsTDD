//
//  MockNetworkManager.swift
//  HackerNewsTDDTests
//
//  Created by YILDIRIM on 5.06.2023.
//

import Foundation
@testable import HackerNewsTDD

class MockNetworkManager: NetworkManagerProtocol {
    
    let jsonFile: String
    
    init(jsonFile: String) {
        self.jsonFile = jsonFile
    }
    
    func fetchHomeViewArticles() async throws -> [Article] {
        guard let jsonUrl = Bundle(for: MockNetworkManager.self).url(forResource: jsonFile, withExtension: "json") else {
            throw NetworkError.invalidURL
        }
        let data = try Data(contentsOf: jsonUrl)
        let decoder = JSONDecoder()
        let results = try decoder.decode(Response.self, from: data)
        return results.hits
    }
}
