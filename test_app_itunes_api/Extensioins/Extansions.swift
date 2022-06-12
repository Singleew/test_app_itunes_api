//
//  Extansions.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 11.06.2022.
//

import Foundation

extension String {
    enum ValidTypes {
        case name
        case email
        case password
    }

    enum Regex: String {
        case name = "[a-zA-Z]{2,}"
        case email = "[a-zA-Z0-9._]{2,}+@[a-zA-Z0-9]{2,}+\\.[a-zA-Z]{2,}"
        case password = "(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}"
    }

    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""

        switch validType {
        case .name: regex = Regex.name.rawValue
        case .email: regex = Regex.email.rawValue
        case .password: regex = Regex.password.rawValue
        }

        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
