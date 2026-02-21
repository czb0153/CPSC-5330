//
//  Country.swift
//  countries_table
//
//  Created by user289052 on 2/21/26.
//

import Foundation

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let code: String
    let capital: String
    let largestCity: String
    let continent: String
    let population: String
    let language: String
    let currency: String
    let flagEmoji: String
}
