//
//  CountryDataSource.swift
//  countries_table
//
//  Created by user289052 on 2/21/26.
//

import Foundation
internal import Combine

class CountryDataSource: ObservableObject {
    @Published var countries: [Country] = [
        Country(
            name: "Brazil",
            code: "BR",
            capital: "Brasilia",
            largestCity: "Sao Paulo",
            continent: "South America",
            population: "213 Million",
            language: "Portuguese",
            currency: "Real",
            flagEmoji: "🇧🇷",
        ),
        
        Country(
            name: "Philippines",
            code: "PH",
            capital: "Manila",
            largestCity: "Quezon City",
            continent: "Asia",
            population: "112 Million",
            language: "Filipino, English",
            currency: "Peso",
            flagEmoji: "🇵🇭",
        ),
        
        Country(
            name: "Australia",
            code: "AU",
            capital: "Canberra",
            largestCity: "Sydney(Metro), Melbourne(Urban)",
            continent: "Australia",
            population: "27 Million",
            language: "English",
            currency: "Australian Dollar",
            flagEmoji: "🇦🇺",
        ),
        
        Country(
            name: "South Africa", 
            code: "ZA",
            capital: "Pretoria(Excutive), Cape Town(Legislative), Bloemfontein(Judicial)",
            largestCity: "Johannesburg",
            continent: "Africa",
            population: "63 Million",
            language: "12 Languages including English and Afrikaans",
            currency: "Rand",
            flagEmoji: "🇿🇦",
        ),
        
        Country(
            name: "Mexico",
            code: "MX",
            capital: "Mexico City",
            largestCity: "Mexico City",
            continent: "North America",
            population: "131 Million",
            language: "Spanish",
            currency: "Peso",
            flagEmoji: "🇲🇽",
        ),
        
        Country(
            name: "Czech Republic (Czechia)",
            code: "CZ",
            capital: "Prague",
            largestCity: "Prague",
            continent: "Europe",
            population: "11 Million",
            language: "Czech",
            currency: "Kourna",
            flagEmoji: "🇨🇿",
        )
    ]
}
