//
//  RegistrationViewController.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 07.06.2022.
//

import UIKit

class RegistrationViewController: UIViewController {
    
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
        phoneTextField.keyboardType = .numberPad
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
    
    //MARK: - ValidTypes
    private let maxNumberCount = 10
    private let regex = try! NSRegularExpression(pattern: "[\\+7\\s-\\(\\)]", options: .caseInsensitive)
    private let firstAndLastNameValidType: String.ValidTypes = .name
    private let emailValidType: String.ValidTypes = .email
    private let passwordValidType: String.ValidTypes = .password
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupDelegate()
        dateOfBithTextField.inputView = datePicker
        setConstraints()
        registerKeyboardShowNotification()
        
        
        //MARK: - Create Hide DataPicker Action
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    deinit {
        removeKeyBoardNotification()
    }
}

//MARK: - Setup Views and StackView, Set Constraints
extension RegistrationViewController {
    
    private func setupViews() {
        
        stackView = UIStackView(arrangedSubviews: [firstNameLabel, firstNameTextField, lastNameLabel, lastNameTextField, dateOfBithLabel, dateOfBithTextField, phoneLabel, phoneTextField, mailLabel, mailTextField, passwordLabel, passwordTextField, requiredFieldLabel])
        stackView.axis = .vertical
        stackView.spacing = 6
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
            titleLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20),
            
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

//MARK: - TextField Setup Delegate
extension RegistrationViewController {
    private func setupDelegate() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        dateOfBithTextField.delegate = self
        phoneTextField.delegate = self
        mailTextField.delegate = self
        passwordTextField.delegate = self
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

//MARK: - Keyboard Notifications Show/Hide
extension RegistrationViewController {
    
    private func registerKeyboardShowNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardSize.height / 2)
        
    }
    
    @objc private func keyboardWillHide(notification: Notification){
        scrollView.contentOffset = CGPoint.zero
    }
    
    private func removeKeyBoardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}






//MARK: - Validate Fields
extension RegistrationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let fullString = (textField.text ?? "") + string
        
        switch textField {
            case firstNameTextField: setTextField(textField: firstNameTextField, label: firstNameLabel, validType: firstAndLastNameValidType, wrongMessage: "Only A-Z symbols, minimum 2 symbols", string: string, range: range)
            case lastNameTextField: setTextField(textField: lastNameTextField, label: lastNameLabel, validType: firstAndLastNameValidType, wrongMessage: "Only A-Z symbols, minimum 2 symbols", string: string, range: range)
            case mailTextField: setTextField(textField: mailTextField, label: mailLabel, validType: emailValidType, wrongMessage: "E-mail is not valide", string: string, range: range)
            case passwordTextField: setTextField(textField: passwordTextField, label: passwordLabel, validType: passwordValidType, wrongMessage: "Minimum 6 symbols: a-z, A-Z, 0-9", string: string, range: range)
            case phoneTextField: phoneTextField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)
                
            default: break
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        mailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    private func setTextField(textField: UITextField, label: UILabel, validType: String.ValidTypes, wrongMessage: String, string: String, range: NSRange) {
        
        let text: String = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let endValue = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<endValue])
        } else {
            result = text
        }
        
        textField.text = result
        
        if result.isValid(validType: validType) {
            label.textColor = .green
        } else {
            label.textColor = .red
            textField.placeholder = wrongMessage
        }
        
    }
    
    //MARK: - Set Phone Mask
    
    private func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else { return "+7" }
        
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: [], range: range, withTemplate: "")
        
        if number.count > maxNumberCount {
            let maxIndex = number.index(number.startIndex, offsetBy: maxNumberCount)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex..<maxIndex])
        }
        
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex..<maxIndex
        

            let pattern = "(\\d{3})(\\d{3})(\\d{2})(\\d{2})"
            number = number.replacingOccurrences(of: pattern, with: "($1) $2-$3-$4", options: .regularExpression, range: regRange)
        
        return "+7" + number
    }

}
