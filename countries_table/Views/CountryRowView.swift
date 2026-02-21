//
//  CountryRowView.swift
//  countries_table
//
//  Created by user289052 on 2/21/26.
//

import SwiftUI

struct CountryRowView: View {
    let country: Country
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(country.name)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            Text(country.flagEmoji)
                .font(.largeTitle)
                .frame(width: 30, height: 30)
        }
        .padding(.vertical, 6)
    }
}
