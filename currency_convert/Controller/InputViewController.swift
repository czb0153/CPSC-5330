//
//  InputViewController.swift
//  currency_convert
//
//  Created by user289052 on 2/15/26.
//

import UIKit

class InputViewController: UIViewController {
    
    
    private let scrollView = UIScrollView()
    private let contentStack = UIStackView()
    
    private let instructionLabel = UILabel()
    private let amountTextField = UITextField()
    private let errorLabel = UILabel()
    
    private let eurSwitch = UISwitch()
    private let gbpSwitch = UISwitch()
    private let jpySwitch = UISwitch()
    private let cadSwitch = UISwitch()
    private let cnySwitch = UISwitch()
    private let audSwitch = UISwitch()
    
    private let convertButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Currency Converter"
        setupUI()
    }
    
    private func setupUI() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        contentStack.axis = .vertical
        contentStack.spacing = 20
        contentStack.alignment = .fill
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentStack)
        
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 30),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -30),
            contentStack.centerXAnchor.constraint(equalTo: scrollView.frameLayoutGuide.centerXAnchor),
            contentStack.widthAnchor.constraint(lessThanOrEqualToConstant: 500)
        ])
        
        instructionLabel.text = "Enter Amount in USD"
        instructionLabel.font = .boldSystemFont(ofSize: 22)
        instructionLabel.textAlignment = .center
        contentStack.addArrangedSubview(instructionLabel)
        
        amountTextField.borderStyle = .roundedRect
        amountTextField.keyboardType = .numberPad
        amountTextField.placeholder =  "e.g. 100"
        amountTextField.font = .systemFont(ofSize: 18)
        contentStack.addArrangedSubview(amountTextField)
        
        errorLabel.text = " "
        errorLabel.textColor = .systemRed
        errorLabel.font = .systemFont(ofSize: 14)
        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .center
        contentStack.addArrangedSubview(errorLabel)
        
        let selectLabel = UILabel()
        selectLabel.text = "Select Currencies:"
        selectLabel.font = .systemFont(ofSize: 16, weight: .medium)
        contentStack.addArrangedSubview(selectLabel)
        
        let switchData: [(UISwitch, Currency)] = [
            (eurSwitch, .EUR),
            (gbpSwitch, .GBP),
            (jpySwitch, .JPY),
            (cadSwitch, .CAD),
            (cnySwitch, .CNY),
            (audSwitch, .AUD)
        ]
        
        for (toggle, currency) in switchData {
            let row = UIStackView()
            row.axis = .horizontal
            row.spacing = 12
            row.alignment = .center
            
            let label = UILabel()
            label.text = currency.rawValue
            label.font = .systemFont(ofSize: 17)
            label.setContentHuggingPriority(.defaultLow, for: .horizontal)
            
            toggle.isOn = false
            
            row.addArrangedSubview(label)
            row.addArrangedSubview(toggle)
            contentStack.addArrangedSubview(row)
        }
        
        convertButton.setTitle("Convert", for: .normal)
        convertButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        convertButton.backgroundColor = .systemBlue
        convertButton.setTitleColor(.white, for: .normal)
        convertButton.layer.cornerRadius = 10
        convertButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        convertButton.addTarget(self, action: #selector(convertButtonTapped), for: .touchUpInside)
        contentStack.addArrangedSubview(convertButton)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func selectedCurrencies() -> [Currency] {
        var currencies: [Currency] = []
        if eurSwitch.isOn { currencies.append(.EUR) }
        if gbpSwitch.isOn { currencies.append(.GBP) }
        if jpySwitch.isOn { currencies.append(.JPY) }
        if cadSwitch.isOn { currencies.append(.CAD) }
        if cnySwitch.isOn { currencies.append(.CNY) }
        if audSwitch.isOn { currencies.append(.AUD) }
        return currencies
    }
    
    @objc private func convertButtonTapped() {
        errorLabel.text = " "
        
        guard let amount = CurrencyConverterModel.validateInput(amountTextField.text) else {
            errorLabel.text = "Invalid input. Please enter a valid numerical value"
            return
        }
        
        let currencies = selectedCurrencies()
        guard !currencies.isEmpty else {
            errorLabel.text = "Please select a currency."
            return
        }
        
        let results = CurrencyConverterModel.convert(amountInUSD: amount, to: currencies)
        
        let resultVC = ResultViewController()
        resultVC.results = results
        resultVC.originalAmount = amount
        navigationController?.pushViewController(resultVC, animated: true)
    }
}
