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

    private let lastNameLabel: UILabel = {
        let lastNameLabel = UILabel()
        lastNameLabel.text = "Second Name"
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return lastNameLabel
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
        setInfoModel()
    }

    private func setupViews() {
        title = "User Info"
        view.backgroundColor = .white

        stackView = UIStackView(arrangedSubviews: [firstNameLabel, lastNameLabel,
                                                   ageLabel, phoneLabel, emailLabel, passwordLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
    }

    private func setInfoModel() {
        guard let activeUser = DataBase.shared.activeUser else { return }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: activeUser.age)

        firstNameLabel.text = "First Name: \(activeUser.firstName!)"
        lastNameLabel.text = "Last Name: \(activeUser.lastName!)"
        ageLabel.text = "Day of Birth: \(dateString)"
        phoneLabel.text = "Phone: \(activeUser.phoneNumber!)"
        emailLabel.text = "E-mail: \(activeUser.mail!)"
        passwordLabel.text = "Password: \(activeUser.password!)"

    }
}

// MARK: - SetConstraints

extension UserInfoViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            //stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
