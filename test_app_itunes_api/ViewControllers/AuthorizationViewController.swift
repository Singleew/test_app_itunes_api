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
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .white
        return backgroundView
    }()
    
    private let authLabel: UILabel = {
        let authLabel = UILabel()
        authLabel.translatesAutoresizingMaskIntoConstraints = false
        authLabel.text = "Authorization"
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
        return passwordTextField
    }()

    
    private let regLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.text = "Don't have an account?"
        return loginLabel
    }()
    
    private let logInButton: UIButton = {
        let logInButtoon = UIButton(type: .system)
        logInButtoon.backgroundColor = .blue
        logInButtoon.setTitle("Log In", for: .normal)
        logInButtoon.tintColor = .white
        logInButtoon.layer.cornerRadius = 5
        logInButtoon.translatesAutoresizingMaskIntoConstraints = false
        logInButtoon.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return logInButtoon
    }()
    
    private let regButton: UIButton = {
        let regButton = UIButton(type: .system)
        regButton.backgroundColor = .white
        regButton.setTitle("Registration", for: .normal)
        regButton.tintColor = .blue
        regButton.translatesAutoresizingMaskIntoConstraints = false
        regButton.addTarget(self, action: #selector(regButtonTapped), for: .touchUpInside)
        return regButton
    }()
    
    //MARK: - Create StackView
    private var textFieldsStack = UIStackView()
    private var buttonsStack = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func setupView() {
        title = "Autorization"
        view.backgroundColor = .white
        
        textFieldsStack = UIStackView(arrangedSubviews: [mailTextField, passwordTextField])
        textFieldsStack.axis = .vertical
        textFieldsStack.spacing = 10
        textFieldsStack.distribution = .fillProportionally
        
        buttonsStack = UIStackView(arrangedSubviews: [logInButton, regLabel, regButton])
        textFieldsStack.axis = .vertical
        textFieldsStack.spacing = 10
        textFieldsStack.distribution = .fillProportionally
        
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(authLabel)
        backgroundView.addSubview(textFieldsStack)
        backgroundView.addSubview(buttonsStack)
    }
    
    //MARK: - Setup delegate
    private func setupTextFieldDelegate() {
        mailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //MARK: - Activate return button on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    //MARK: - Setup constaints
    

    @objc func logInButtonTapped() {
        guard let albumsVC = UINavigationController(rootViewController: AlbumsViewController()) else { return }
        albumsVC.modalPresentationStyle = .fullScreen
        self.present(albumsVC, animated: true)
        
    }
    
    @objc func regButtonTapped() {
        guard let regVC = RegistrationViewController() else { return }
        self.present(regVC, animated: true)
        
    }
    


}


extension AuthorizationViewController {
    
    
}
