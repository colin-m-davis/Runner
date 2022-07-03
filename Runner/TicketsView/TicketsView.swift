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
        // TODO: Sometimes, Navigation title doesn't adjust properly when scrolling down through list. Weird situation that I don't know how to describe. Seems to happen only on first go around.
        NavigationView {
            VStack{
                if viewModel.tickets.count == 0 {
                    Text("No tickets to display.")
                }
                List(viewModel.tickets) { ticket in
                    TicketRowView(ticket: ticket)
                        .swipeActions {
                            Button {
                                viewModel.deleteTicket(ticket: ticket)
                            } label: {
                                Image(systemName: "trash")
                            }
                            .tint(.red)
                        }
                }
                .animation(.default, value: viewModel.tickets.count)
                
                Spacer()
                
                NavigationLink("New Ticket", destination: NewTicketView())
                    .frame(width: 200, height: 50)
                    .foregroundColor(Color(.white))
                    .background(Color(.green))
                    .cornerRadius(5)
            }
            .onAppear() {
                viewModel.fetchTickets()
            }
            .navigationBarTitle("Tickets", displayMode: .inline)
        }
    }
}

struct TicketsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketsView()
    }
}
