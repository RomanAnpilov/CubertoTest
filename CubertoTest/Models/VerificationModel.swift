//
//  VerificationModel.swift
//  CubertoTest
//
//  Created by Роман Анпилов on 10.04.2022.
//

import Foundation

class VerificationModel {
    
    private let mailsArray = ["@gmail.com", "@yandex.ru", "@yahoo.com", "@outlook.com", "@icloud.com", "@mail.ru", "@hotmail.com","@skynet.be"]
    
    public var nameMail = String()
    public var filteredMail = [String]()
    
    private func filterMail (text: String) {
        var domainMail = String()
        filteredMail = []
        
        guard let firstIndex = text.firstIndex(of: "@") else {return}
        let endIndex = text.index(before: text.endIndex)
        let range = text[firstIndex...endIndex]
        domainMail = String(range)
        
        mailsArray.forEach{mail in
            if mail.contains(domainMail) {
                if !filteredMail.contains(mail) {
                    filteredMail.append(mail)
                }
            }
        }
    }
    
    private func cutEmailName(text: String) {
        guard let atIndex = text.firstIndex(of: "@") else {return}
        let endIndex = text.index(before: atIndex)
        let firstIndex = text.startIndex
        let range = text[firstIndex...endIndex]
        
        nameMail = String(range)
    }
    
    public func getFiltereMail (text: String) {
        filterMail(text: text)
    }
    
    public func getMailName (text: String) {
        cutEmailName(text: text)
    }
}
