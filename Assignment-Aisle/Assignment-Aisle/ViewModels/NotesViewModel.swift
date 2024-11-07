//
//  NotesViewModel.swift
//  Assignment-Aisle
//
//  Created by Gaddam, Nagatejesh on 07/11/24.
//

import Foundation

struct AuthResponse: Decodable {
    let auth_token: String
}

class NotesViewModel {
    
    static func fetchNotes(authToken: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        
        guard let url = URL(string: "https://app.aisle.co/V1/users/test_profile_list") else {
            completion(.failure(NSError()))
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let _ = data {
                completion(.success(true))
            } else {
                completion(.failure(NSError()))
            }
        }.resume()
    }
}
