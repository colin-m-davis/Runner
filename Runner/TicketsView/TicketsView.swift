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
        NavigationView {
            VStack{
                NavigationLink("+", destination: NewTicketView())
                
                if viewModel.tickets.count == 0 {
                    Text("No tickets to display.")
                }
                
                List(viewModel.tickets) { ticket in
                    TicketRowView(ticket: ticket)
                        .background(Color(UIColor.secondarySystemBackground))
                }
                .animation(.default, value: viewModel.tickets.count)
                
                Spacer()
            }
            .onAppear() {
                viewModel.fetchTickets()
            }
        }
    }
}

struct TicketsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketsView()
    }
}
