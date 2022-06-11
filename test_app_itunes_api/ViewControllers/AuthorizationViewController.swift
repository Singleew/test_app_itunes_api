//
//  AuthorizationViewController.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 06.06.2022.
//

import UIKit

class AuthorizationViewController: UIViewController, UITextFieldDelegate {

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
    
    private let authLabel: UILabel = {
        let authLabel = UILabel()
        authLabel.text = "Authorization"
        authLabel.textAlignment = .center
        authLabel.font = authLabel.font.withSize(30)
        authLabel.translatesAutoresizingMaskIntoConstraints = false
        return authLabel
    }()
    
    private let mailTextField: UITextField = {
        let mailTextField = UITextField()
        mailTextField.borderStyle = .roundedRect
        mailTextField.placeholder = "Enter your e-mail"
        return mailTextField
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    private let logInButton: UIButton = {
        let logInButtoon = UIButton(type: .system)
        logInButtoon.backgroundColor = .blue
        logInButtoon.setTitle("Log In", for: .normal)
        logInButtoon.tintColor = .white
        logInButtoon.layer.cornerRadius = 5
        logInButtoon.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        logInButtoon.translatesAutoresizingMaskIntoConstraints = false
        return logInButtoon
    }()
    
    private let regButton: UIButton = {
        let regButton = UIButton(type: .system)
        regButton.backgroundColor = .white
        regButton.setTitle("Don't have an account? Click here!", for: .normal)
        regButton.tintColor = .blue
        regButton.layer.cornerRadius = 5
        regButton.addTarget(self, action: #selector(regButtonTapped), for: .touchUpInside)
        regButton.translatesAutoresizingMaskIntoConstraints = false
        return regButton
    }()
    
    //MARK: - Create StackView
    private var textFieldsStack = UIStackView()
    private var buttonsStack = UIStackView()
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTextFieldDelegate()
        setConstraints()
    }
    
    //MARK: - Setup Views and StackView
    private func setupView() {
        view.backgroundColor = .white
        textFieldsStack = UIStackView(arrangedSubviews: [authLabel, mailTextField, passwordTextField])
        textFieldsStack.axis = .vertical
        textFieldsStack.spacing = 10
        textFieldsStack.distribution = .fillProportionally
        textFieldsStack.translatesAutoresizingMaskIntoConstraints = false
        
        buttonsStack = UIStackView(arrangedSubviews: [logInButton, regButton])
        buttonsStack.axis = .vertical
        buttonsStack.spacing = 10
        buttonsStack.distribution = .fillProportionally
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
       // backgroundView.addSubview(authLabel)
        backgroundView.addSubview(textFieldsStack)
        backgroundView.addSubview(buttonsStack)
    }
    
    //MARK: - Setup delegate
    private func setupTextFieldDelegate() {
        mailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //MARK: - Activate return button on keyboard
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    

    
    //MARK: - logInButtonTapped Action
    @objc private func logInButtonTapped() {
        //let albumsVC = UINavigationController(rootViewController: AlbumsViewController())
        //albumsVC.modalPresentationStyle = .fullScreen
        //self.present(albumsVC, animated: true)
        
    }

    //MARK: - regButtonTapped Action
    @objc private func regButtonTapped() {
        let regVC = RegistrationViewController()
        self.present(regVC, animated: true)
        
    }
    


}

//MARK: - Set constaints
extension AuthorizationViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
            backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            authLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            textFieldsStack.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            textFieldsStack.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            textFieldsStack.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            textFieldsStack.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
        ])
        

        
        NSLayoutConstraint.activate([
            regButton.heightAnchor.constraint(equalToConstant: 40),
            logInButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            buttonsStack.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            buttonsStack.topAnchor.constraint(equalTo: textFieldsStack.bottomAnchor, constant: 30),
            buttonsStack.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
        ])
    }
}
