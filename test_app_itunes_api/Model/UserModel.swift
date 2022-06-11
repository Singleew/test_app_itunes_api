//
//  UserModel.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 11.06.2022.
//

import Foundation

struct User: Codable {
    
    let firstName: String
    let lastName: String
    let age: Date
    let phoneNumber: String
    let mail: String
    let password: String
}
