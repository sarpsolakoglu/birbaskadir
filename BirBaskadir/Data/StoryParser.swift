//
//  StoryParser.swift
//  BirBaskadir
//
//  Created by Sarp Solakoglu on 22/12/2020.
//

import Foundation

class StoryParser {
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    static func loadStory(file: String) -> Story {
        var story = Story(pages: [])
        guard let data = try? dataFrom(file: file) else {
            return story
        }
        do {
            story = try decoder.decode(Story.self, from: data)
        } catch let error {
            print(error)
        }
        return story
    }

    private static func dataFrom(file: String) throws -> Data {
        let path = Bundle(for: StoryParser.self).path(forResource: file, ofType: "json")!
        return try Data(contentsOf: URL(fileURLWithPath: path))
    }
}
