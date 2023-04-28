//
//  SignUpViewModel.swift
//  AlvBarros
//
//  Created by Alvaro Barros on 2023-04-28.
//

import Foundation
import FirebaseAuth

enum FirebaseError: Error, Identifiable {
    case error(String)
    
    var id: UUID {
        UUID()
    }
    
    var message: String {
        switch self {
        case .error(let msg):
                return msg
        }
    }
}

class SignUpViewModel: ObservableObject {
    @Published var errorMessage: String?
    
    func signUp(email: String, password: String, completion: @escaping (Result<Bool, FirebaseError>) -> Void) {
        // ??????
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error {
                DispatchQueue.main.async {
                    completion(.failure(.error(error.localizedDescription)))
                }
                
            } else {
                DispatchQueue.main.async {
                    completion(.success(true))
                }
            }
        }
    }
}
