//
//  NetworkManager.swift
//  HackerNewsTDD
//
//  Created by YILDIRIM on 4.06.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchHomeViewArticles() async throws -> [Article]
}

class NetworkManager: NetworkManagerProtocol {
    
    private let url = "https://hn.algolia.com/api/v1/search?tags=front_page"
    private init() {
        
    }
    
    func fetchHomeViewArticles() async throws -> [Article] {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        let (data, httpResponse) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = httpResponse as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        let decoder = JSONDecoder()
        let results = try decoder.decode(Response.self, from: data)
        print(results.hits)
        return results.hits
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidServerResponse
}
