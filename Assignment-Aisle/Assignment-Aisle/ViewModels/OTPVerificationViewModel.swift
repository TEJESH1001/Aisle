//
//  OTPVerificationViewModel.swift
//  Assignment-Aisle
//
//  Created by Gaddam, Nagatejesh on 07/11/24.
//

import Foundation

class OTPVerificationViewModel {
    
    static func otpVerify(number: String, otp: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "https://app.aisle.co/V1/users/verify_otp") else {
            completion(.failure(NSError()))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let parameters = ["number": number, "otp": otp]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            //Note: auth_token is not available in the response, so passing a auth_token string value.
            completion(.success("auth_token"))
        }.resume()
    }
}
