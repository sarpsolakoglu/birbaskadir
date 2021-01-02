//
//  BirBaskadirApp.swift
//  BirBaskadir
//
//  Created by Sarp Solakoglu on 22/12/2020.
//

import SwiftUI

@main
struct BirBaskadirApp: App {
    var body: some Scene {
        WindowGroup {
            PageView(manager: StoryManager())
        }
    }
}
