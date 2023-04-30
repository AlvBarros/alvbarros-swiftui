//
//  UserViewModel.swift
//  AlvBarros
//
//  Created by Alvaro Barros on 2023-04-29.
//

import SwiftUI

class UserViewModel: ObservableObject {
    @Published var isAuthenticated: Bool
    @Published var username: String?
    @Published var email: String?
    @Published var imageUrl: String?
    
    init(isAuthenticated: Bool, username: String? = nil, email: String? = nil, imageUrl: String? = nil) {
        self.isAuthenticated = isAuthenticated
        self.username = username
        self.email = email
        self.imageUrl = imageUrl
    }
}
