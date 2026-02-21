//
//  AdventureModel.swift
//  my_adventure
//
//  Created by user289052 on 2/7/26.
//

import Foundation

struct AdventureChoice: Identifiable {
    let id = UUID()
    let text: String
    let nextSceneId: String?
    let isWinning: Bool
    
    init(text: String, nextSceneId: String? = nil, isWinning: Bool = false) {
        self.text = text
        self.nextSceneId = nextSceneId
        self.isWinning = isWinning
    }
}

struct AdventureScene: Identifiable {
    let id: String
    let title: String
    let description: String
    let imageName: String?
    let choices: [AdventureChoice]
    let isEnding: Bool
    
    init(id: String, title: String, description: String, imageName: String? = nil, choices: [AdventureChoice] = [], isEnding: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.imageName = imageName
        self.choices = choices
        self.isEnding = isEnding
    }
}

struct Adventure {
    let title: String
    let scenes: [String: AdventureScene]
    let startingSceneId: String
}
