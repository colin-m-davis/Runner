//
//  TicketRowView.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import SwiftUI

struct TicketRowView: View {
    
    @StateObject var viewModel: TicketRowViewModel
    @State var expanded = false
    
    var body: some View {
        VStack {
            DisclosureGroup(isExpanded: $expanded) {
                VStack {
                    ForEach(viewModel.details, id: \.self) { detail in
                        Divider()
                        HStack {
                            Image(systemName: detail[0]).frame(width: 30)
                            Text(detail[1])
                            Spacer()
                        }
                        .frame(height: 25)
                    }
                }
            } label: {
                HStack {
                    Text(viewModel.ticket.number)
                        .bold()
                    Spacer()
                    if viewModel.ticket.isDaily {
                        Image(systemName: "sun.max")
                    } else {
                        Image(systemName: "moon")
                    }
                }
            }
        }
        .swipeActions {
            Button {
                viewModel.deleteTicket()
            } label: {
                Image(systemName: "trash")
            }
            .tint(.red)
        }
    }
}

struct TicketRowView_Previews: PreviewProvider {
    static var previews: some View {
        TicketRowView(viewModel: TicketRowViewModel(ticket: Ticket()))
    }
}
