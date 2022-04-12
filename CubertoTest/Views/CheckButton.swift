//
//  CheckButton.swift
//  CubertoTest
//
//  Created by Роман Анпилов on 10.04.2022.
//

import Foundation
import UIKit

class CheckButton: UIButton {
    public var isValid = false {
        didSet {
            isValid ? setValid() : setNotValid()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton () {
        setTitle("Verificate", for: .normal)
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 0.5020474195, green: 0.2104767263, blue: 0.9762799144, alpha: 1)
        isEnabled = false
        alpha = 0.5
    }
    
    private func setNotValid () {
        isEnabled = false
        alpha = 0.5
    }
    
    private func setValid () {
        isEnabled = true
        alpha = 1
    }
    
    public func setDefault() {
        setupButton()
    }
}
