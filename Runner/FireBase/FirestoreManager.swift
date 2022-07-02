//
//  StorageManager.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import Foundation
import FirebaseFirestore

class FirestoreManager : ObservableObject {
    
    private let db = Firestore.firestore()
    
    func createUserDoc(user_uid: String) -> Bool {
        var success : Bool = false
        if !user_uid.isEmpty {
            let ticket = Ticket()
            if addTicket(user_uid: user_uid, ticket: ticket) {
                success = true
            } else {
                print("Could not add default ticket to new user collection")
            }
        } else {
            print("Cannot create new user document: User UID must not be nil")
        }
        return success
    }
    
    // Adds the Ticket to the tickets collection of the user provided
    func addTicket(user_uid: String, ticket: Ticket) -> Bool {
        var success : Bool = false
        if let ticket_uid = ticket.id {
            let docRef = db.collection("users").document(user_uid).collection("tickets").document(ticket_uid)
            do {
                try docRef.setData(from: ticket)
                success = true
            } catch {
                print(error)
            }
        } else {
            print("Cannot add ticket: Ticket UID must not be nil")
        }
        return success
    }

}
