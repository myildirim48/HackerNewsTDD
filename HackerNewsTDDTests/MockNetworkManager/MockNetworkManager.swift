//
//  MockNetworkManager.swift
//  HackerNewsTDDTests
//
//  Created by YILDIRIM on 5.06.2023.
//

import Foundation
@testable import HackerNewsTDD



class MockNetworkManager: NetworkManagerProtocol {
    func fetchHomeViewArticles() async throws -> [Article] {
        guard let jsonUrl = Bundle(for: MockNetworkManager.self).url(forResource:"MultiJSONResponse", withExtension: "json") else {
            throw NetworkError.invalidURL
        }
        let data = try Data(contentsOf: jsonUrl)
        let decoder = JSONDecoder()
        let results = try decoder.decode(Response.self, from: data)
        return results.hits
    }
    func fetchSingleArticle() async throws -> [Article] {
        guard let jsonUrl = Bundle(for: MockNetworkManager.self).url(forResource:"SingleJSONResponse", withExtension: "json") else {
            throw NetworkError.invalidURL
        }
        let data = try Data(contentsOf: jsonUrl)
        let decoder = JSONDecoder()
        let results = try decoder.decode(Response.self, from: data)
        return results.hits
    }
    
    func fetchInvalidArticle() async throws -> [Article] {
        guard let jsonUrl = Bundle(for: MockNetworkManager.self).url(forResource:"InvalidJSONResponse", withExtension: "json") else {
            throw NetworkError.invalidURL
        }
        let data = try Data(contentsOf: jsonUrl)
        let decoder = JSONDecoder()
        let results = try decoder.decode(Response.self, from: data)
        return results.hits
    }
}
