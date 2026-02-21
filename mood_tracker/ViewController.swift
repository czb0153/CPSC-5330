//
//  ViewController.swift
//  mood_tracker
//
//  Created by user289052 on 1/30/26.
//


import UIKit

class ViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Mood Tracker"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private let moodSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.tintColor = .systemOrange
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    } ()
    
    private let moodDisplayLabel: UILabel = {
        let label = UILabel()
        label.text = "Neutral 😐"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker .datePickerMode = .date
        
        if #available(iOS 13.4, *) {
            picker.preferredDatePickerStyle = .compact
        } else {
            picker.datePickerMode = .date
        }
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    } ()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button .setTitle("Save Mood", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.font = UIFont.italicSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        setupUI()
        setupActions()
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(moodDisplayLabel)
        stackView.addArrangedSubview(moodSlider)
        stackView.addArrangedSubview(datePicker)
        stackView.addArrangedSubview(saveButton)
        stackView.addArrangedSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            moodSlider.widthAnchor.constraint(equalToConstant: 250),
            saveButton.widthAnchor.constraint(equalToConstant: 200),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.leadingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
            
        ])
    }
    
    private func setupActions() {
        moodSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func getMoodInfo(value: Float) -> (text: String, emoji: String) {
        switch value{
        case 0...20:
            return ("Very Sad", "😢")
        case 21...40:
            return ("Sad", "🙁")
        case 41...60:
            return ("Netural", "😐")
        case 61...80:
            return("Happy", "🙂")
        case 81...100:
            return ("Very Happy", "😄")
        default:
            return ("Happy","🙂")
        }
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        let value = sender.value
        let moodInfo = getMoodInfo(value: value)
        
        moodDisplayLabel.text = "\(moodInfo.text) \(moodInfo.emoji)"
    }
    
    @objc private func saveButtonTapped() {
        let selectedDate = datePicker.date
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMMM d"
        
        let dateString = dateFormatter.string(from: selectedDate)
        
        let currentMoodValue = moodSlider.value
        let moodInfo = getMoodInfo(value: currentMoodValue)
        
        resultLabel.text = "On \(dateString), you felt \(moodInfo.emoji)"
        
        UIView.animate(withDuration: 0.1, animations: {
            self.resultLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) {_ in
            UIView.animate(withDuration: 0.1) {
                self.resultLabel.transform = .identity
            }
        }
    }
}
