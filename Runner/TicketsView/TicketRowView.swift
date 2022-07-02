//
//  TicketRowView.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import SwiftUI

struct TicketRowView: View {
    let ticket: Ticket
    let dt: String // This shouldn't have been so hard
    
    init(ticket: Ticket) {
        self.ticket = ticket
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        self.dt = formatter.string(from: ticket.issued.dateValue())
    }
    
    var body: some View {
        HStack {
            Text(dt)
            Text(ticket.id ?? "NO UID")
        }
        .background(Color(.red))
    }
}

struct TicketRowView_Previews: PreviewProvider {
    static var previews: some View {
        TicketRowView(ticket: Ticket())
    }
}
