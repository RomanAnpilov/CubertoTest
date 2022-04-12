//
//  Alert.swift
//  CubertoTest
//
//  Created by Роман Анпилов on 10.04.2022.
//

import Foundation
import UIKit

struct Alert {
    static func showAlert(vc: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)
        DispatchQueue.main.async {
            vc.present(alertController, animated: true, completion: nil)
        }
    }
}
