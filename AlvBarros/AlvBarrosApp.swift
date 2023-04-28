//
//  AlvBarrosApp.swift
//  AlvBarros
//
//  Created by Alvaro Barros on 2023-04-28.
//

import SwiftUI
import FirebaseCore

enum Route: Hashable {
    case logIn
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

class Coordinator: ObservableObject {
    @Published var path = [Route]()
}

@main
struct AlvBarrosApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @ObservedObject var coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                ContentView().navigationDestination(for: Route.self) { route in
                    switch route {
                    case .logIn:
                        Text("Login Screen!")
                    }
                }
            }.environmentObject(coordinator)
        }
    }
}
