//
//  TicketsViewModel.swift
//  Runner
//
//  Created by Colin Davis on 7/2/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class TicketsViewModel: ObservableObject {
    
    @Published var tickets = [Ticket]()
    
    /// Get last 20 tickets of current user
    func fetchTickets() {
        
        /// Validate session
        let firebaseAuth = Auth.auth()
        guard let uid = firebaseAuth.currentUser?.uid else {
            print("Error: Could not verify user")
            return
        }
        
        /// Map user's "tickets" collection to array
        let db = Firestore.firestore()
        let ticketsRef = db.collection("users").document(uid).collection("tickets")
        ticketsRef.order(by: "issued", descending: true).limit(to: 20).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No tickets to fetch")
                return
            }
            self.tickets = documents.compactMap { queryDocumentSnapshot -> Ticket? in
                return try? queryDocumentSnapshot.data(as: Ticket.self)
            }
        }
    }
    
    /// Remove ticket from user's "tickets" collection by ID
    func deleteTicket(ticket: Ticket) {
        
        /// Validate session
        let firebaseAuth = Auth.auth()
        guard let uid = firebaseAuth.currentUser?.uid else {
            print("Error: Could not verify user")
            return
        }
        
        /// Validate Ticket ID
        guard let id = ticket.id else {
            print("Error: Invalid ticket ID")
            return
        }
        
        /// Remove document with corresponding Ticket ID from collection
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid).collection("tickets").document(id)
        docRef.delete() { error in
            guard error == nil else {
                print("Error: Could not delete document: \(String(describing: error))")
                return
            }
        }
    }
}
