//
//  NewTicketViewModel.swift
//  Runner
//
//  Created by Colin Davis on 7/2/22.
//

import Foundation

class NewTicketViewModel : ObservableObject {
    @Published var isDaily = false
    // Section: Owner
    @Published var nameText = ""
    @Published var roomText = ""
    @Published var departureDate = Date()
    // Section: Vehicle
    @Published var makeText = ""
    @Published var modelText = ""
    @Published var colorText = ""
    // Section: Other
    @Published var notesText = ""
    
    func addTicket() {
        // TODO - package field entries into Ticket object and send to correct collection in Firebase
        
        // Validation...Optional fields...Type casting...oh my
    }
}
