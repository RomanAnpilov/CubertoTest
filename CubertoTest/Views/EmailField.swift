//
//  EmailField.swift
//  CubertoTest
//
//  Created by Роман Анпилов on 10.04.2022.
//

import Foundation
import UIKit

protocol EmailFieldProtocol: AnyObject {
    func typingText(text: String)
    func cleanOutTextField()
}

class EmailField: UITextField {
    
    weak var emailDelegate: EmailFieldProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupField()
        
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupField() {
        backgroundColor = .white
        tintColor = #colorLiteral(red: 0.5020474195, green: 0.2104767263, blue: 0.9762799144, alpha: 1)
        layer.cornerRadius = 10
        layer.borderColor = #colorLiteral(red: 0.5020474195, green: 0.2104767263, blue: 0.9762799144, alpha: 0.5)
        layer.borderWidth = 1
        textColor = .black
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: frame.height))
        leftViewMode = .always
        placeholder = "E-mail"
        clearButtonMode = .always
        returnKeyType = .done
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension EmailField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let rangeText = Range(range, in: text) {
            let updateText = text.replacingCharacters(in: rangeText, with: string)
            emailDelegate?.typingText(text: updateText)
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        emailDelegate?.cleanOutTextField()
        return true
    }
}
