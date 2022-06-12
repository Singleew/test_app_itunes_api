//
//  Alert.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 12.06.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Continue", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
