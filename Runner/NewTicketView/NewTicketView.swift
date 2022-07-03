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
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    Toggle("Daily", isOn: $viewModel.isDaily.animation())
                    Section(header: Text("Owner")) {
                        TextField("Name", text: $viewModel.nameText)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        if !viewModel.isDaily {
                            TextField("Room Number", text: $viewModel.roomText)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            DatePicker(selection: $viewModel.departureDate, in: Date()..., displayedComponents: .date) {
                                Text("Departure Date")
                            }
                        } else {
                            TextField("Event", text: $viewModel.eventText)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                    }
                    Section(header: Text("Vehicle")) {
                        TextField("Make", text: $viewModel.makeText)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        TextField("Model", text: $viewModel.modelText)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        TextField("Color", text: $viewModel.colorText)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .alert(isPresented: $viewModel.showErrorMessage) {
                        Alert(
                            title: Text("Error"),
                            message: Text(viewModel.errorMessage),
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
