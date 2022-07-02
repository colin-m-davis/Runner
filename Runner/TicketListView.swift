//
//  TicketListView.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import SwiftUI

struct TicketListView: View {
    
    @State var tickets : [Ticket] = []
    
    @EnvironmentObject var authState : AuthState
    var body: some View {
        VStack{}
            .onAppear(perform: loadList)
    }
    
    func loadList() {
        let db = FirestoreManager()
        self.tickets = db.getTickets(user_uid: authState.getUserID())
    }
}

struct TicketListView_Previews: PreviewProvider {
    static var previews: some View {
        TicketListView()
    }
}
