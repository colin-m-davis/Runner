//
//  SignInModel.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import Foundation
import FirebaseAuth

class AuthState: ObservableObject {
    
    let firebaseAuth = Auth.auth()
    
    // Boolean that represents whether or not the user has signed in.
    @Published var isSignedIn : Bool = false;
    
    // Boolean that represents whether or not there is a current request to Firebase.
    @Published var requestProcessing : Bool = false;
    
    // Returns the current user's UID. Returns an empty string if the request failed.
    func getUserID() -> String {
        guard let userID = firebaseAuth.currentUser?.uid else { return "" }
        return userID
    }
    
    // Returns the current user's email address. Returns an empty string if the request failed.
    func getUserEmail() -> String {
        guard let userEmail = firebaseAuth.currentUser?.email else { return "" }
        return userEmail
    }
    
    // Attempts to sign in with provided email and password. Updates isSignedIn to true on success.
    func signIn(email: String, password: String) {
        
        requestProcessing = true
        
        firebaseAuth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print(error?.localizedDescription ?? "Unknown error occurred while attempting to sign in.")
                self?.requestProcessing = false
                return
            }
            
            DispatchQueue.main.async {
                self?.requestProcessing = false
                self?.isSignedIn = true
            }
            
        }
        
    }
    
    // Attempts to register a new user with provided email and password. Updates isSignedIn to true on success.
    func register(email: String, password: String) {
        
        requestProcessing = true
        
        firebaseAuth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print(error?.localizedDescription ?? "Unknown error occurred while attempting to create user.")
                self?.requestProcessing = false
                return
            }
        
            DispatchQueue.main.async {
                self?.requestProcessing = false
                self?.isSignedIn = true
                if let uid = self?.getUserID() {
                    let db = FirestoreManager()
                    db.createUserDoc(uid: uid)
                } else {
                    print("Wahhhh--****************")
                }
            }
        }
        
    }
    
    // Attemps to sign the user out. Updates isSignedIn to false on success.
    func signOut() {
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print(signOutError)
        }
        isSignedIn = false
    }
    
}
