//
//  SignInModel.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import Foundation
import FirebaseAuth

class SignInViewModel : ObservableObject {
    
    // Boolean that represents whether or not there is a current request to Firebase.
    @Published var requestProcessing : Bool = false;
    
    @Published var email = ""
    @Published var password = ""
    @Published var verifypassword = ""
    
    private let firebaseAuth = Auth.auth()
    
    // Attempts to sign in with provided email and password. Updates isSignedIn to true on success.
    func signIn() {
        
        requestProcessing = true
        
        firebaseAuth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print(error?.localizedDescription ?? "Unknown error occurred while attempting to sign in.")
                self?.requestProcessing = false
                return
            }
            
            DispatchQueue.main.async {
                self?.requestProcessing = false
            }
            
        }
        
    }
    
    // Attempts to register a new user with provided email and password. Updates isSignedIn to true on success.
    func register() {
        
        requestProcessing = true
        
        firebaseAuth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print(error?.localizedDescription ?? "Unknown error occurred while attempting to create user.")
                self?.requestProcessing = false
                return
            }
        
            DispatchQueue.main.async {
                self?.requestProcessing = false
            }
        }
        
    }
    
}
