//
//  ViewController.swift
//  CubertoTest
//
//  Created by Роман Анпилов on 10.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let checkLabel = CheckLabel()
    private let mailField = EmailField()
    private let checkButton = CheckButton()
    private let collectionView = AutoCompleteCollectionView(frame: .zero,
                                                            collectionViewLayout: UICollectionViewFlowLayout())
    
    private lazy var stackView = UIStackView(arrangedSubviews: [mailField,
                                                                checkButton,
                                                                collectionView],
                                             axis: .vertical,
                                             spacing: 20)
    private let verificationModel = VerificationModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setViews()
        setDelegates()
        setConstraints()
    }
    
    fileprivate func setViews() {
        view.backgroundColor = .white
        view.addSubview(checkLabel)
        view.addSubview(stackView)
        checkButton.addTarget(self,
                              action: #selector(buttonTapped),
                              for: .touchUpInside)
    }
    
    fileprivate func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectMailDelegate = self
        mailField.emailDelegate = self
    }
    
    @objc func buttonTapped() {
        guard let mail = mailField.text else {return}
        
        APICaller.shared.verifyEmail(email: mail){result in switch result {
            case .success(let data):
                Alert.showAlert(vc: self, title: data.result, message: data.reason)
            case .failure(let error):
                Alert.showAlert(vc: self, title: "Error", message: error.localizedDescription)
            }
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        
        let cellText = verificationModel.filteredMail[indexPath.row]
        cell.setText(labelText: cellText)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return verificationModel.filteredMail.count
    }
}

extension MainViewController: SelectMailProtocol {
    func selectMail(indexPath: IndexPath) {
        guard let text = mailField.text else {return}
        verificationModel.getMailName(text: text)
        let domainMail = verificationModel.filteredMail[indexPath.row]
        let mailFullName = verificationModel.nameMail + domainMail
        mailField.text = mailFullName
        checkLabel.isValid = mailFullName.validateMail()
        checkButton.isValid = mailFullName.validateMail()
        verificationModel.filteredMail = []
        collectionView.reloadData()
    }
}

extension MainViewController: EmailFieldProtocol {
    func typingText(text: String) {
        checkLabel.isValid = text.validateMail()
        checkButton.isValid = text.validateMail()
        verificationModel.getFiltereMail(text: text)
        collectionView.reloadData()
    }
    
    func cleanOutTextField() {
        checkLabel.setDefault()
        checkButton.setDefault()
        verificationModel.filteredMail = []
        collectionView.reloadData()
    }
}

extension MainViewController {
    
    fileprivate func setConstraints () {
        NSLayoutConstraint.activate([
            checkLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            checkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            mailField.heightAnchor.constraint(equalToConstant: 50),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
            stackView.topAnchor.constraint(equalTo: checkLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

        ])
    }
}
