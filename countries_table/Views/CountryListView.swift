//
//  CountryListView.swift
//  countries_table
//
//  Created by user289052 on 2/21/26.
//

import SwiftUI

struct CountryListView: View {
    @EnvironmentObject var dataSource: CountryDataSource
    
    var body: some View {
        List(dataSource.countries) { country in
            NavigationLink(destination: CountryDetailView(country: country)) {
                CountryRowView(country: country)
            }
        }
        .listStyle(.plain)
        .navigationTitle("My Favorite Countries")
    }
}
