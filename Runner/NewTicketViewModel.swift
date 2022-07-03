//
//  NewTicketViewModel.swift
//  Runner
//
//  Created by Colin Davis on 7/2/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class NewTicketViewModel: ObservableObject {
    
    @Published var numberText = ""
    @Published var isDaily = false
    /// Section: Owner
    @Published var nameText = ""
        /// Overnight
    @Published var roomText = ""
    @Published var departureDate = Date()
        /// Daily
    @Published var eventText = ""
    /// Section: Vehicle
    @Published var makeText = ""
    @Published var modelText = ""
    @Published var colorText = ""
    
    /// Alert displayed if the user tries to create a new ticket with no number
    @Published var showErrorMessage = false
    
    func addTicket() -> Bool {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate] // "YYYY-MM-DD"
        
        if numberText.isEmpty {
            showErrorMessage.toggle()
            print("Error: \"Number\" field must not be empty")
            return false
        }
        // TODO: Extended input validation
        
        let number = numberText
        let name = nameText
        var room = roomText
        var departure = formatter.string(from: departureDate)
        var event = eventText
        let make = makeText
        let model = modelText
        let color = colorText
        
        if !isDaily {
            event = ""
        } else {
            room = ""
            departure = formatter.string(from: Date())
        }
        
        /// Instantiate ticket object
        let ticket = Ticket(number:number,
                            name:name,
                            room:room,
                            departure:departure,
                            event:event,
                            make:make,
                            model:model,
                            color:color)
        
        let firebaseAuth = Auth.auth()
        guard let uid = firebaseAuth.currentUser?.uid else {
            print("Error: Could not verify user")
            return false
        }
        guard let id = ticket.id else {
            print("Error: Could not get ticket ID")
            return false
        }
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid).collection("tickets").document(id)
        do {
            try docRef.setData(from: ticket)
            print("Success: Document written")
            return true
        } catch {
            print("Error: Could not write document: \(error)")
            return false
        }
    }
}
