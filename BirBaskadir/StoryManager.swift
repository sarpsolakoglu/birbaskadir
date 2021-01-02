//
//  StoryManager.swift
//  BirBaskadir
//
//  Created by Sarp Solakoglu on 22/12/2020.
//

import Foundation

class StoryManager: ObservableObject {
    @Published var currentPage: Page
    let story: Story
    var previousPageId: String

    init(file: String = "story") {
        self.story = StoryParser.loadStory(file: file)
        self.currentPage = story.pages[0]
        self.previousPageId = story.pages[0].id
    }

    func changeCurrentPage(pageId: String) {
        var searchId = pageId
        if pageId == "back" {
            searchId = previousPageId
        }
        if let page = story.pages.filter({ $0.id == searchId }).first {
            self.previousPageId = currentPage.id
            self.currentPage = page
        }
    }
}
