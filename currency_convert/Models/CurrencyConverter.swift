//
//  CurrencyConverter.swift
//  currency_convert
//
//  Created by user289052 on 2/15/26.
//
import Foundation

enum Currency: String, CaseIterable {
    case EUR = "Euro (EUR)"
    case GBP = "British Pound (GBP)"
    case JPY = "Japanese Yen (JPY)"
    case CAD = "Canadian Dollar (CAD)"
    case CNY = "Chinese Yuan Renminbi"
    case AUD = "Australian Dollar"
    
    var rateFromUSD: Double {
        switch self {
        case .EUR: return 0.84
        case .GBP: return 0.73
        case .JPY: return 152.69
        case .CAD: return 1.36
        case .CNY: return 6.90
        case .AUD: return 1.41
        }
    }
    
    var symbol: String {
        switch self {
        case .EUR: return "€"
        case .GBP: return "£"
        case .JPY: return "¥"
        case .CAD: return "C$"
        case .CNY: return "¥"
        case .AUD: return "A$"
        }
    }
}

struct ConversionResult {
    let currency: Currency
    let convertedAmount: Double
    
    var displayString: String {
        if currency == .JPY {
            return String(format: "%@: %@%. 0f",
                          currency.rawValue, currency.symbol,
                          currency.symbol, convertedAmount)
        }
        return String(format: "%@: %@%.2f", currency.rawValue,
                      currency.symbol, convertedAmount)
    }
}

class CurrencyConverterModel {
    
    static func validateInput(_ input: String?) -> Int? {
        guard let text = input, !text.isEmpty else { return nil }
        guard let value = Int(text), value > 0 else { return nil }
        return value
    }
    
    static func convert(amountInUSD: Int, to currencies: [Currency]) -> [ConversionResult] {
        return currencies.map { currency in
            let converted = Double(amountInUSD) * currency.rateFromUSD
            return ConversionResult(currency: currency, convertedAmount: converted)
        }
    }
}

