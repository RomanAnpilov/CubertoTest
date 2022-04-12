//
//  CheckLabel.swift
//  CubertoTest
//
//  Created by Роман Анпилов on 10.04.2022.
//

import Foundation
import UIKit

class CheckLabel: UILabel {
    
    public var isValid = false {
        didSet {
            isValid ? setValid() : setNotValid()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel () {
        text = "Verificate your E-mail"
        font = .boldSystemFont(ofSize: 15)
        textColor = .black
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setNotValid () {
        text = "Email not valid. example@domain.com"
        textColor = #colorLiteral(red: 0.4901960784, green: 0.1843137255, blue: 0.2470588235, alpha: 1)
    }
    
    private func setValid () {
        text = "All right!"
        textColor = #colorLiteral(red: 0.4823529412, green: 0.5215686275, blue: 0.2274509804, alpha: 1)
    }
    
    public func setDefault() {
        setupLabel()
    }
}
