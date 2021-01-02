//
//  PageView.swift
//  BirBaskadir
//
//  Created by Sarp Solakoglu on 22/12/2020.
//

import SwiftUI

struct PageView: View {
    @ObservedObject var manager: StoryManager
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(manager.currentPage.content, id: \.self) {
                    ContentView(content: $0)
                        .padding([.leading, .trailing], 20)
                }
                Spacer()
                    .frame(height: 10)
                ForEach(manager.currentPage.options, id: \.self) {
                    OptionButton(option: $0, action: { pageId in
                        manager.changeCurrentPage(pageId: pageId)
                    })
                    .padding(.horizontal, 20)
                }
            }
        }
    }
}

struct OptionButton: View {
    let option: Option
    let action: ((String) -> Void)?
    var body: some View {
        Button(action: {
            action?(option.linkedStoryId)
        }) {
            Text(option.text)
                .font(.body)
                .foregroundColor(.primary)
                .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .overlay(Capsule()
                        .stroke(lineWidth: 2)
                        .foregroundColor(.primary))
    }
}

struct ContentView: View {
    let content: Content
    var body: some View {
        VStack {
            switch content.type {
            case .title:
                Text(content.description)
                    .font(.title)
                    .foregroundColor(.primary)
                    .underline()
            case .body:
                Text(content.description)
                    .font(.body)
                    .foregroundColor(.primary)
            case .image:
                Image(content.description)
                    .resizable()
                    .scaledToFit()
                    .border(Color.primary, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.vertical, 5)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(manager: StoryManager())
            .preferredColorScheme(.light)
    }
}
