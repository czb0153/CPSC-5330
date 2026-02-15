//
//  ResultViewController.swift
//  currency_convert
//
//  Created by user289052 on 2/15/26.
//

import UIKit

class ResultViewController: UIViewController {
    var results: [ConversionResult] = []
    var originalAmount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Results"
        setupUI()
    }
    
    private func setupUI() {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
        
        let titleLabel = UILabel()
        titleLabel.text = "Conversion for $\(originalAmount) USD"
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.textAlignment = .center
        stack.addArrangedSubview(titleLabel)
        
        let separator = UIView()
        separator.backgroundColor = .separator
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.widthAnchor.constraint(equalToConstant: 280).isActive = true
        stack.addArrangedSubview(separator)
        
        for result in results {
            let label = UILabel()
            label.text = "\(result.currency.rawValue): \(result.currency.symbol)" + String(format: result.currency == .JPY ? "%.0f" : "%.2f", result.convertedAmount)
            label.font = .systemFont(ofSize: 19)
            label.numberOfLines = 0
            stack.addArrangedSubview(label)
        }
    }
}
