//
//  TicketRowViewModel.swift
//  Runner
//
//  Created by Colin Davis on 7/3/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class TicketRowViewModel: ObservableObject {
    
    var ticket: Ticket
    var details: [[String]] = []
    
    init(ticket: Ticket) {
        self.ticket = ticket
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let issueDate = formatter.string(from: ticket.issued.dateValue())
        
        if ticket.isDaily {
            self.details = [
                ["clock", issueDate],
                ["person", ticket.name],
                ["airplane.departure", ticket.departure],
                ["building", ticket.room],
                ["hammer", ticket.make],
                ["car", ticket.model],
                ["paintbrush", ticket.color]
            ]
        } else {
            self.details = [
                ["clock", issueDate],
                ["person", ticket.name],
                ["pin", ticket.event],
                ["hammer", ticket.make],
                ["car", ticket.model],
                ["paintbrush", ticket.color]
            ]
        }
    }
    
    /// Remove ticket from user's "tickets" collection by ID
    func deleteTicket() {
        
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
