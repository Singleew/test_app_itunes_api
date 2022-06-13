//
//  UserDefaultsManager.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 11.06.2022.
//

import Foundation

class DataBase {
    
    static let shared = DataBase()
    
    enum SettingKeys: String {
        case users
        case activeUser
    }
    
    let defaults = UserDefaults.standard
    let userKey: String = SettingKeys.users.rawValue
    let activeUserKey = SettingKeys.activeUser.rawValue
    
    var users: [User] {
        get {
            if let data = defaults.value(forKey: userKey) as? Data {
                return try! PropertyListDecoder().decode([User].self, from: data)
            } else {
                return [User]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: userKey)
            }
        }
    }
    
    var activeUser: User? {
        get {
            if let data = defaults.value(forKey: activeUserKey) as? Data {
                return try! PropertyListDecoder().decode(User.self, from: data)
            } else {
                return nil
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: activeUserKey)
            }
        }
    }
    
    
    func saveUser(firstName: String, lastName: String, age: Date, phoneNumber: String, mail: String, password: String) {
        
        let user = User(firstName: firstName, lastName: lastName, age: age, phoneNumber: phoneNumber, mail: mail, password: password)
        users.insert(user, at: 0)
    }
    
    func saveActiveUser(user: User) {
        activeUser = user
    }
    
    func fetchUser(mail: String) -> User? {
        let userData = self.users
        for user in userData {
            if user.mail == mail {
                return user
            }
        }
        return nil
    }
}
