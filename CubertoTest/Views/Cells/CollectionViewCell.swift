//
//  CollectionViewCell.swift
//  CubertoTest
//
//  Created by Роман Анпилов on 10.04.2022.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private let domain: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell () {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = #colorLiteral(red: 0.7882352941, green: 0.6666666667, blue: 0.968627451, alpha: 1)
        contentView.layer.borderWidth = 1
        
        addSubview(domain)
    }
    
    public func setText(labelText: String) {
        domain.text = labelText
    }
    
}

extension CollectionViewCell {
    
    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            domain.centerXAnchor.constraint(equalTo: centerXAnchor),
            domain.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
