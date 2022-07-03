//
//  LoginView.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel : SignInViewModel
    
    @State var verifypassword = ""
    
    var body: some View {
        VStack {
            TextField("Email Address", text: $viewModel.email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            SecureField("Verify Password", text: $viewModel.verifypassword)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            Button(action : {
                viewModel.register()
            }, label: {
                Text("Create account")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .cornerRadius(5)
            })
            if viewModel.requestProcessing {
                Text("Loading...")
            }
        }
        .padding()
        .navigationTitle("Create Account")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewModel: SignInViewModel())
    }
}
