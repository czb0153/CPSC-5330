//
//  countries_tableApp.swift
//  countries_table
//
//  Created by user289052 on 2/21/26.
//

import SwiftUI

@main
struct countries_tableApp: App {
    @StateObject private var dataSource = CountryDataSource()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CountryListView()
            }
            .navigationViewStyle(.stack)
            .environmentObject(dataSource)
        }
    }
}
