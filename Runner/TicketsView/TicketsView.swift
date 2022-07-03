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
                                print("Delete")
                            } label: {
                                Text("Oh yeah")
                            }
                        }
                }
                .animation(.default, value: viewModel.tickets.count)
                .clipped()
                
                // TODO: This button is ugly AF
                NavigationLink("New Ticket", destination: NewTicketView())
                    .frame(width: 200, height: 50)
                    .background(Color(.blue))
                
                Spacer()
            }
            .onAppear() {
                viewModel.fetchTickets()
            }
            .navigationBarTitle("Tickets")
        }
    }
}

struct TicketsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketsView()
    }
}
