//
//  Content.swift
//  BirBaskadir
//
//  Created by Sarp Solakoglu on 22/12/2020.
//

import Foundation

enum ContentType: String, Decodable {
    case title
    case body
    case image
}

struct Content: Decodable, Hashable {
    let type: ContentType
    let description: String
}
