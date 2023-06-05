//
//  Article.swift
//  HackerNewsTDD
//
//  Created by YILDIRIM on 4.06.2023.
//

import Foundation

struct Response: Codable {
    let hits: [Article]
}

struct Article: Codable {
    let title: String
    let author: String?
    let points: Int?
    let objectID: String?
    let url: String?
}

