//
//  ViewController.swift
//  Bear-Down
//
//  Created by user289052 on 1/10/26.
//

import UIKit

class ViewController: UIViewController {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BearDownLogo.png")
        imageView.contentMode = .scaleAspectFit;
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let teamLabel: UILabel = {
        let label = UILabel()
        label.text = "Bear Down!"
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textColor = UIColor(red: 200/255, green: 56/255, blue: 3/255, alpha: 1.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 11/255, green: 22/255, blue: 42/255, alpha: 1.0)
        view.addSubview(logoImageView)
        view.addSubview(teamLabel)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            
            teamLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            teamLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            teamLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            teamLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

