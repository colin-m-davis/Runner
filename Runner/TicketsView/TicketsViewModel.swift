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
    
    private let db = Firestore.firestore()
    private let uid = Auth.auth().currentUser!.uid // We use this to access the correct document in the "users" collection
    
    // Last 20 tickets
    func fetchTickets() {
        let ticketsRef = db.collection("users").document(uid).collection("tickets")
        ticketsRef.order(by: "issued", descending: true).limit(to: 20).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No tickets to fetch :/")
                return
            }
            self.tickets = documents.compactMap { queryDocumentSnapshot -> Ticket? in
                return try? queryDocumentSnapshot.data(as: Ticket.self)
            }
        }
    }
}
