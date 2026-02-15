//
//  AdventureController.swift
//  my_adventure
//
//  Created by user289052 on 2/7/26.
//

import Foundation
import Combine


class AdventureController: ObservableObject {
    
    @Published private(set) var currentScene: AdventureScene
    @Published private(set) var isGameOver: Bool = false
    @Published private(set) var didWin: Bool = false
    @Published private(set) var choiceHistory: [String] = []
    
    private let adventure: Adventure
    
    init() {
        self.adventure = AdventureController.createAdventure()
        self.currentScene = adventure.scenes[adventure.startingSceneId]!
    }
    
    func makeChoice(_ choice: AdventureChoice) {
        choiceHistory.append(choice.text)
        
        if choice.isWinning {
            didWin = true
            isGameOver = true
            if let nextSceneId = choice.nextSceneId,
               let nextScene = adventure.scenes[nextSceneId] {
                currentScene = nextScene
            }
            return
        }
        
        guard let nextSceneId = choice.nextSceneId,
              let nextScene = adventure.scenes[nextSceneId] else {
            isGameOver = true
            didWin = false
            return
        }
        
        currentScene = nextScene
        
        if nextScene.isEnding {
            isGameOver = true
        }
    }
    
    func restartAdventure() {
        currentScene = adventure.scenes[adventure.startingSceneId]!
        isGameOver = false
        didWin = false
        choiceHistory.removeAll()
    }
    
    private static func createAdventure() -> Adventure {
        let scenes: [String: AdventureScene] = [
            "start": AdventureScene(
                id: "start",
                title: "Stranded in the Amazon",
                description: "Your plane has crashed in the heart of the Amazon rainforest. You aren't injured, but all alone. The dense jungle surrounds you with the sounds of birds and rushing water nearby. You managed to find a machete and a water bottle from the wreckage",
                imageName: "airplane",
                choices: [
                    AdventureChoice(text: "Follow the sound of rushing water", nextSceneId: "river"),
                    AdventureChoice(text: "Climb a tall tree to survey the area", nextSceneId: "treetop"),
                    AdventureChoice(text: "Stay near the wreckage and signal for help", nextSceneId: "wait_rescue")
                ]
            ),
            
            "river": AdventureScene(
                id: "river",
                title: "The Amazon River",
                description: "You push through thick vegetation and discover a wide, muddy river. A fallen log could serve as a raft. You also notice a narrow trail along the riverbank and an abandon canoe along the riverbank and an abandoned canoe hidden in the reeds.",
                imageName: "water.waves",
                choices: [
                    AdventureChoice(text: "Take the abandoned canoe downstream", nextSceneId: "canoe_journey"),
                    AdventureChoice(text: "Follow the trail along the riverbank", nextSceneId: "riverbank_trail"),
                    AdventureChoice(text: "Wade into the river to cool off", nextSceneId: "caiman")
                ]
            ),
            
            "treetop": AdventureScene(
                id: "treetop",
                title: "Above the Canopy",
                description: "You climb a massive kapok tree and break through the canopy. The view is amazing with green stretching to the horizon. You spot smoke rising in the distance and notice a group of spider monkeys curiously watching you.",
                imageName: "tree.fill",
                choices: [
                    AdventureChoice(text: "Head toward the smoke", nextSceneId: "village"),
                    AdventureChoice(text: "Follow the monkeys to see where they go", nextSceneId: "monkey_path"),
                    AdventureChoice(text: "Climb down and return to the crash site", nextSceneId: "start"),
                ]
            ),
            
            "wait_rescue": AdventureScene(
                id: "wait_rescue",
                title: "A Long Wait",
                description: "You build a signal fire and wait for rescue. Days pass with no sign of aircraft. Your supplies run out, and the jungle closes in around you. Without water or food, you grow too weak to move on...",
                imageName: "flame.fill",
                isEnding: true
            ),
            
            "canoe_journey": AdventureScene(
                id: "canoe_journey",
                title: "River Journey",
                description: "The canoe carries you swiftly downstream. You pass pink river dolphins playing. After several hours, you spot a small riverside settlement with wooden houses on stilts.",
                imageName: "ferry.fill",
                choices: [
                    AdventureChoice(text: "Paddle toward the settlement", nextSceneId: "friendly_village"),
                    AdventureChoice(text: "Continue past and keep going downstream", nextSceneId: "rapids"),
                    AdventureChoice(text: "Stop and set up camp on the riverbank", nextSceneId: "jaguar")
                ]
            ),
            
            "riverbank_trail": AdventureScene(
                id: "riverbank_trail",
                title: "The Hidden Trail",
                description: "The trail leads to an ancient stone structure overgrown with vines. It appears to be ruins from a lost civilization. Inside the dark entrance, you hear dripping water. Strange carvings decorate the walls",
                imageName: "building.columns.fill",
                choices: [
                    AdventureChoice(text: "Explore inside the ruins", nextSceneId: "ruins_treasure"),
                    AdventureChoice(text: "Search around the outside", nextSceneId: "snake_pit"),
                    AdventureChoice(text: "Leave and go back to the river", nextSceneId: "river")
                ]
            ),
            
            "caiman": AdventureScene(
                id: "caiman",
                title: "Deadly Waters",
                description: "The moment you wade into the murky water, you notice what looks like a floating log drifting towards you. Before you can react, a BLACK CAIMAN LUNGES! Its powerful jaws clamp down before you can escape. The river claims another victim...",
                imageName: "exclamationmark.triangle.fill",
                isEnding: true
            ),
            
            "village": AdventureScene(
                id: "village",
                title: "Indigenous Village",
                description: "You trek through the jungle towards the smoke. You encounter members of an indigenous tribe. They are cautious yet not hostile. One elder steps forwards and gestures for your approach.",
                imageName: "person.3.fill",
                choices: [
                    AdventureChoice(text: "Approach peacefully.", nextSceneId: "tribe_welcome"),
                    AdventureChoice(text: "Offer your water bottle as a gift", nextSceneId: "tribe_gift"),
                    AdventureChoice(text: "Back away slowly and leave", nextSceneId: "lost_jungle")
                ]
            ),
            
            "monkey_path": AdventureScene(
                id: "monkey_path",
                title: "Followings the Monkeys",
                description: "The spider monkeys lead you through the treetops to a grove of fruit trees. You feast on mangos and Brazil nuts. Refreshed, you noticed monkeys heading toward a clearing with a reseach station",
                imageName: "image.fill",
                choices: [
                    AdventureChoice(text: "Head to the research station", nextSceneId: "research_station", isWinning: true)
                ]
            ),
            
            "friendly_village": AdventureScene(
                id: "friendly_village",
                title: "Riverside  Community",
                description: "The villagers welcome you warmly. They speak som Portuguese and explain that a supply boat comes every week. They offer food, shelter, and promise to help you get home.",
                imageName: "house.fill",
                choices: [
                    AdventureChoice(text: "Them them and wait for the supply boat", nextSceneId: "victory", isWinning: true)
                ]
            ),
            
            "rapids": AdventureScene(
                id: "rapids",
                title: "Deadly Rapids",
                description: "The river suddenly narrows and the current itensifies. Before you can react, the canoe is pulled into violent rapids. The small boat capsizes against the rocks, and the powerful current drags you under...",
                imageName: "water.waves",
                isEnding: true
            ),
            
            "jaguar": AdventureScene(
                id: "jaguar",
                title: "Night Visitor",
                description: "You managed to set up camp for the night. In the middle of the night, you wake to glowing eyes watching you from the shadows. A jaguar circles you, you are unable to escape...",
                imageName: "moon.fill",
                isEnding: true
            ),
            
            "ruins_treasure": AdventureScene(
                id: "ruins_treasure",
                title: "Ancient Discovery",
                description: "Inside the ruins, you find pottery, gold artifacts, and ancient tools. More importantly, you discover the ruins sit on high ground with a clear view. You spot a radio tower in the distance, CIVILIZATION!",
                imageName: "star.fill",
                choices: [
                    AdventureChoice(text: "Head towards the radio tower", nextSceneId: "victory", isWinning: true)
                ]
            ),
            
            "snake_pit": AdventureScene(
                id: "snake_pit",
                title: "Serpent's Den",
                description: "While searching outside, you step through rotted wood covering and old pit. You fall into a nest of venomous CORAL SNAKES! Their hisses are the last sound you hear...",
                imageName: "xmark.circle.fill",
                isEnding: true
            ),
            
            "tribe_welcome": AdventureScene(
                id: "tribe_welcome",
                title: "Accepted by the tribe",
                description: "The elder smiles at your approach. Through gestures, they understand you are lost. They provide food, medicine, and after a few days, guide you to the nearest town. You survived thanks to their kindness.",
                imageName: "hands.sparkles.fil",
                choices: [
                    AdventureChoice(text: "Express gratitude and head into town", nextSceneId: "victory", isWinning: true)
                ]
            ),
            
            "tribe_gift": AdventureScene(
                id: "tribe_gift",
                title: "A generous Exchange",
                description: "The tribe is impressed by your gift. In return, they give you died fish, medicinal plants, and a hand-drawn map showing the way to a missionary outpost three days' walk away.",
                imageName: "gift.fill",
                choices: [
                    AdventureChoice(text: "Follow the map to the outpost", nextSceneId: "victory", isWinning: true),
                    AdventureChoice(text: "Ask to stay with the tribe longer", nextSceneId: "tribe_welcome")
                ]
            ),
            
            "lost_jungle": AdventureScene(
                id: "lost_jungle",
                title: "Lost Forever",
                description: "You retreat into the jungle but quickly loose your sense of direction. The canopy blocks out the sun, and every direction looks the same. Days pass as you wonder in circles, growing weaker...",
                imageName: "questionmark.circle.fill",
                isEnding: true
            ),
            
            "research_station": AdventureScene(
                id: "research_station",
                title: "Rescued at Last",
                description: "You stumble into a wildlife research station! The scientists are shocked to see you but quickly provide medical care, food, and contact rescue services. A helicopter arives to take you home",
                imageName: "cross.circle.fill",
                choices: [
                    AdventureChoice(text: "Rest and await rescue", nextSceneId: "victory", isWinning: true)
                ]
            ),
            
            "victory": AdventureScene(
                id: "victory", title: "Survivor!",
                description: "Agaisnt all odds, you survived the Amazon rainforest! Your courage and quick thinking has brought you safely out of one of the world's most dangerous wilderness areas.",
                imageName: "trophy.fill",
                isEnding: true
            )
        ]
        return Adventure(
            title: "Amazon Survival",
            scenes: scenes,
            startingSceneId: "start"
        )
    }
}
