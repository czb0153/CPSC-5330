//
//  CountryDetailView.swift
//  countries_table
//
//  Created by user289052 on 2/21/26.
//

import SwiftUI

struct CountryDetailView: View {
    
    let country: Country
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(country.flagEmoji)
                    .font(.system(size: 100))
                    .padding(.top, 20)
                
                Text(country.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(country.continent)
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                Divider()
                
                if horizontalSizeClass == .regular {
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ],
                        spacing: 165
                    ) {
                        detailCards
                    }
                    .padding(.horizontal)
                } else {
                    VStack(spacing: 12) {
                        detailCards
                    }
                    .padding(.horizontal)
                }
                
                Divider()
                    .padding(.horizontal)
                
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer(minLength: 40)
            }
        }
        .navigationTitle(country.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    var detailCards: some View {
        DetailCardView(icon: "building.columns.fill", title: "Capital", value: country.capital)
        DetailCardView(icon: "building.columns.fill", title: "Largest City", value: country.largestCity)
        DetailCardView(icon: "person.3.fill", title: "Population", value: country.population)
        DetailCardView(icon: "text.bubble.fill", title: "Language", value: country.language)
        DetailCardView(icon: "dollarsign.circle.fill", title: "Currency", value: country.currency)
    }
}
