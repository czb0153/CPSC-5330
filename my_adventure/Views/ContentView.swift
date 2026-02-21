//
//  ContentView.swift
//  my_adventure
//
//  Created by user289052 on 2/7/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var controller = AdventureController()
    
    var body: some View {
        NavigationStack {
            AdventureView(controller: controller)
                .navigationTitle("MyAdventure")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
