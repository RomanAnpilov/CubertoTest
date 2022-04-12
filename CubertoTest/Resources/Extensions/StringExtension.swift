//
//  StringExtension.swift
//  CubertoTest
//
//  Created by Роман Анпилов on 10.04.2022.
//

import Foundation

extension String {
    func validateMail () -> Bool{
        let regex = "[a-zA-Z0-9._]+@[a-zA-Z]+\\.[a-z]{2,4}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
}
