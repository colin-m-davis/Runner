//
//  RunnerApp.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import SwiftUI
import Firebase

@main
struct RunnerApp: App {
    @StateObject var authState = AuthState()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(authState)
        }
    }
}
