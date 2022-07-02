//
//  NewTicketView.swift
//  Runner
//
//  Created by Colin Davis on 7/2/22.
//

import SwiftUI

struct NewTicketView : View {
    
    @StateObject var viewModel = NewTicketViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Toggle("Daily", isOn: $viewModel.isDaily.animation())
                Section(header: Text("Owner")) {
                    TextField("Name", text: $viewModel.nameText)
                    if !viewModel.isDaily {
                        TextField("Room Number", text: $viewModel.roomText)
                        DatePicker(selection: $viewModel.departureDate, in: ...Date(), displayedComponents: .date) {
                            Text("Departure Date")
                        }
                    }
                }
                Section(header: Text("Vehicle")) {
                    TextField("Make", text: $viewModel.makeText)
                    TextField("Model", text: $viewModel.modelText)
                    TextField("Color", text: $viewModel.colorText)
                }
                Section(header: Text("Other")) {
                    TextField("Notes", text: $viewModel.notesText)
                }
            }
            .navigationTitle("New ticket")
        }
    }
}

struct NewTicketView_Previews: PreviewProvider {
    static var previews: some View {
        NewTicketView()
    }
}
