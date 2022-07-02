//
//  TicketListView.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import SwiftUI

struct TicketsView : View {
    
    @StateObject var viewModel = TicketsViewModel()
    
    var body: some View {
        VStack{
            NavigationLink("+", destination: NewTicketView())
            List(viewModel.tickets) { ticket in
                TicketRowView(ticket: ticket)
            }
        }
        .onAppear() {
            viewModel.fetchTickets()
        }
    }
}

struct TicketsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketsView()
    }
}
