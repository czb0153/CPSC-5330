//
//  ContentView.swift
//  currency_convert
//
//  Created by user289052 on 2/15/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CurrencyConverterView()
            .ignoresSafeArea()
    }
}

struct CurrencyConverterView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let inputVC = InputViewController()
        let navController = UINavigationController(rootViewController: inputVC)
        return navController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}
