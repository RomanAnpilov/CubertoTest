//
//  APICaller.swift
//  CubertoTest
//
//  Created by Роман Анпилов on 10.04.2022.
//

import Foundation

let apiKey = "live_1902b17e7a81c1b1de4c67537fb1b726b75f12ad29e50f2f1b46a18f0dad5a86"
let mainURL = "https://api.kickbox.com/v2/verify"

class APICaller {
    static let shared = APICaller()
    private init () {}
    
    func verifyEmail(email: String, completion: @escaping(Result<APIResponse, Error>) -> Void) {
        guard let url = URL(string: "\(mainURL)?email=\(email)&apikey=\(apiKey)") else {return}
        
        URLSession.shared.dataTask(with: url) {data, _, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {return}
                
                do {
                    let mail = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(mail))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
    
}
