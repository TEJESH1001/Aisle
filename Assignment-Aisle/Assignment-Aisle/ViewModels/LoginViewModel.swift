//
//  LoginViewModel.swift
//  Assignment-Aisle
//
//  Created by Gaddam, Nagatejesh on 07/11/24.
//

import Foundation

class LoginViewModel {
    
    static func phoneNumberLogin(number: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: "https://app.aisle.co/V1/users/phone_number_login") else {
            completion(.failure(NSError()))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let parameters = ["number": number]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(true))
        }.resume()
    }
}
