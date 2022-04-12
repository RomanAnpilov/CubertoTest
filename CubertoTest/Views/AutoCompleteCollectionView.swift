//
//  AutoCompleteCollectionView.swift
//  CubertoTest
//
//  Created by Роман Анпилов on 10.04.2022.
//

import Foundation
import UIKit

public let cellId = "MailCell"

protocol SelectMailProtocol: AnyObject {
    func selectMail(indexPath: IndexPath)
}

class AutoCompleteCollectionView: UICollectionView {
    
    weak var selectMailDelegate:SelectMailProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setupView()
        register(CollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        delegate = self
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
    }
}

extension AutoCompleteCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectMailDelegate?.selectMail(indexPath: indexPath)
    }
}

extension AutoCompleteCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 40)
    }
}
