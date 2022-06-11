//
//  RegistrationViewController.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 07.06.2022.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Create UI Objects
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .white
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Registration"
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let firstNameLabel: UILabel = {
        let firstNameLabel = UILabel()
        firstNameLabel.text = "First Name" + " *"
        firstNameLabel.font = UIFont.systemFont(ofSize: 14)
        return firstNameLabel
    }()
    
    private let firstNameTextField: UITextField = {
        let firstNameTextField = UITextField()
        firstNameTextField.borderStyle = .roundedRect
        firstNameTextField.placeholder = "Enter First Name"
        return firstNameTextField
    }()
    
    private let lastNameLabel: UILabel = {
        let lastNameLabel = UILabel()
        lastNameLabel.text = "Last Name" + " *"
        lastNameLabel.font = UIFont.systemFont(ofSize: 14)
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return lastNameLabel
    }()
    
    private let lastNameTextField: UITextField = {
        let lastNameTextField = UITextField()
        lastNameTextField.borderStyle = .roundedRect
        lastNameTextField.placeholder = "Enter Last Name"
        return lastNameTextField
    }()
    
    private let dateOfBithLabel: UILabel = {
        let mailLabel = UILabel()
        mailLabel.text = "Date of birth" + " *"
        mailLabel.font = UIFont.systemFont(ofSize: 14)
        mailLabel.translatesAutoresizingMaskIntoConstraints = false
        return mailLabel
    }()
    
    private let dateOfBithTextField: UITextField = {
        let dateOfBithTextField = UITextField()
        dateOfBithTextField.borderStyle = .roundedRect
        dateOfBithTextField.placeholder = "Tap to select the date of birth"
        return dateOfBithTextField
    }()
    
    private let phoneLabel: UILabel = {
        let phoneLabel = UILabel()
        phoneLabel.text = "Phone number" + " *"
        phoneLabel.font = UIFont.systemFont(ofSize: 14)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        return phoneLabel
    }()
    
    private let phoneTextField: UITextField = {
        let phoneTextField = UITextField()
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.placeholder = "Enter phone number"
        return phoneTextField
    }()
    
    private let mailLabel: UILabel = {
        let mailLabel = UILabel()
        mailLabel.text = "E-mail" + " *"
        mailLabel.font = UIFont.systemFont(ofSize: 14)
        mailLabel.translatesAutoresizingMaskIntoConstraints = false
        return mailLabel
    }()
    
    private let mailTextField: UITextField = {
        let mailTextField = UITextField()
        mailTextField.borderStyle = .roundedRect
        mailTextField.placeholder = "Enter e-mail"
        return mailTextField
    }()
    
    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Password" + " *"
        passwordLabel.font = UIFont.systemFont(ofSize: 14)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Enter password"
        return passwordTextField
    }()
    
    private let requiredFieldLabel: UILabel = {
        let requiredFieldLabel = UILabel()
        requiredFieldLabel.text = "* - required fields"
        requiredFieldLabel.font = UIFont.systemFont(ofSize: 14)
        requiredFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        return requiredFieldLabel
    }()
    
    private let createAccountButton: UIButton = {
        let createAccountButton = UIButton(type: .system)
        createAccountButton.backgroundColor = .blue
        createAccountButton.setTitle("Create an account", for: .normal)
        createAccountButton.tintColor = .white
        createAccountButton.layer.cornerRadius = 5
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        return createAccountButton
    }()
    
    //MARK: - Create Date Picker
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.backgroundColor = .white
        datePicker.tintColor = .black
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        return datePicker
    }()
    
    
    //MARK: - Create StackView
    private var stackView = UIStackView()
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        //setupDelegate()
        dateOfBithTextField.inputView = datePicker
        setConstraints()
        
        //MARK: - Create Hide DataPicker Action
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        self.view.addGestureRecognizer(tapGesture)
    }
}

//MARK: - Setup Views and StackView, Set Constraints
extension RegistrationViewController {
    
    private func setupViews() {
        
        stackView = UIStackView(arrangedSubviews: [firstNameLabel, firstNameTextField, lastNameLabel, lastNameTextField, dateOfBithLabel, dateOfBithTextField, phoneLabel, phoneTextField, mailLabel, mailTextField, passwordLabel, passwordTextField, requiredFieldLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(stackView)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(createAccountButton)
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            backgroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backgroundView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            backgroundView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -40),
            
            stackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            
            createAccountButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            createAccountButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            createAccountButton.heightAnchor.constraint(equalToConstant: 40),
            createAccountButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}


//MARK: - CreateAccountButtonTapped Action
extension RegistrationViewController {
    
    @objc func createAccountButtonTapped() {
        let alert = UIAlertController(title: "Warning!", message: "This feature is not active yet", preferredStyle: .alert)
        let action = UIAlertAction(title: "Skip", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
        
    }
}

////MARK: - UITextFieldDelegate
//extension RegistrationViewController: UITextFieldDelegate {

//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        return false
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        firstNameTextField.resignFirstResponder()
//        lastNameTextField.resignFirstResponder()
//        mailTextField.resignFirstResponder()
//        passwordTextField.resignFirstResponder()
//        return true
//    }
//
//}



//MARK: - Select the date of birth
extension RegistrationViewController {
    private func getDateFromPicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        dateOfBithTextField.text = formatter.string(from: datePicker.date)
    }
    
    @objc private func dateChanged() {
        getDateFromPicker()
    }
    
    @objc private func tapGestureDone() {
        self.view.endEditing(true)
    }
}
