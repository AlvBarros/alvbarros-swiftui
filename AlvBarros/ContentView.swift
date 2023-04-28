//
//  ContentView.swift
//  AlvBarros
//
//  Created by Alvaro Barros on 2023-04-28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @StateObject private var vm = SignUpViewModel()
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Spacer().frame(height: 16)
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button("Sign Up") {
                vm.signUp(email: email, password: password) { result in
                    switch result {
                    case .success(_):
//                        print("Take the user to login screen")
                        coordinator.path.append(.logIn)
                    case .failure(let error):
                        vm.errorMessage = error.message
                    }
                }
            }.buttonStyle(.borderedProminent)
            if vm.errorMessage != nil {
                Text(vm.errorMessage!)
            }
            
            Spacer()
                .navigationTitle("Sign Up")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
