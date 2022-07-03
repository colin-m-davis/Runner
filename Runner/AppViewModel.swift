//
//  AppViewModel.swift
//  Runner
//
//  Created by Colin Davis on 7/2/22.
//

import Foundation
import FirebaseAuth

class AppViewModel : ObservableObject {
    @Published var currentUser: User? = nil
    
    private var handle : AuthStateDidChangeListenerHandle? = nil
    
    private let firebaseAuth = Auth.auth()
    
    init () {
        self.handle = firebaseAuth.addStateDidChangeListener { [weak self] (_, user) in
            if let user = user {
                self?.currentUser = user
            }
        }
    }
}
