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

}
