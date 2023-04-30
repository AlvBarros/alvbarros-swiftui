//
//  AlvBarrosApp.swift
//  AlvBarros
//
//  Created by Alvaro Barros on 2023-04-28.
//

import SwiftUI

@main
struct AlvBarrosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var userViewModel = UserViewModel(isAuthenticated: false)
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .environmentObject(userViewModel)
        }
    }
}
