//
//  UserInfoViewController.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 11.06.2022.
//

import UIKit

class UserInfoViewController: UIViewController {

    private let firstNameLabel: UILabel = {
        let firstNameLabel = UILabel()
        firstNameLabel.text = "First Name"
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return firstNameLabel
    }()
    
    private let secondNameLabel: UILabel = {
        let secondNameLabel = UILabel()
        secondNameLabel.text = "Second Name"
        secondNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return secondNameLabel
    }()
    
    private let ageLabel: UILabel = {
        let ageLabel = UILabel()
        ageLabel.text = "Age"
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        return ageLabel
    }()
    
    private let phoneLabel: UILabel = {
        let phoneLabel = UILabel()
        phoneLabel.text = "Phone"
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        return phoneLabel
    }()
    
    private let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    
    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()

    private var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        title = "User Info"
        view.backgroundColor = .white

        stackView = UIStackView(arrangedSubviews: [firstNameLabel, secondNameLabel, ageLabel, phoneLabel, emailLabel, passwordLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        view.addSubview(stackView)
    }
}

//MARK: - SetConstraints

extension UserInfoViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
