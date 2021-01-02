//
//  Page.swift
//  BirBaskadir
//
//  Created by Sarp Solakoglu on 22/12/2020.
//

import Foundation

struct Page: Decodable {
    let id: String
    let content: [Content]
    let options: [Option]
}
