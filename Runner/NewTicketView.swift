//
//  NewTicketView.swift
//  Runner
//
//  Created by Colin Davis on 7/2/22.
//

import SwiftUI

struct NewTicketView : View {
    
    @ObservedObject var viewModel = NewTicketViewModel()
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
                Form {
                    TextField("Number (Required)", text: $viewModel.numberText)
                    Toggle("Daily", isOn: $viewModel.isDaily.animation())
                    Section(header: Text("Owner")) {
                        TextField("Name", text: $viewModel.nameText)
                        if !viewModel.isDaily {
                            TextField("Room Number", text: $viewModel.roomText)
                            DatePicker(selection: $viewModel.departureDate, in: Date()..., displayedComponents: .date) {
                                Text("Departure Date")
                            }
                        } else {
                            TextField("Event", text: $viewModel.eventText)
                        }
                    }
                    Section(header: Text("Vehicle")) {
                        TextField("Make", text: $viewModel.makeText)
                        TextField("Model", text: $viewModel.modelText)
                        TextField("Color", text: $viewModel.colorText)
                    }
                    .alert(isPresented: $viewModel.showErrorMessage) {
                        Alert(
                            title: Text("Error"),
                            message: Text("Please enter the ticket number."),
                            dismissButton: .default(Text("OK")))
                    }
                }
        .navigationBarItems(trailing: Button(
            action: {
                if viewModel.addTicket() {
                    self.mode.wrappedValue.dismiss()
                }
            },
            label: { Text("Submit") }
        ))
        .navigationBarTitle("New Ticket", displayMode: .inline)
    }
}

struct NewTicketView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewTicketView()
        }
    }
}
