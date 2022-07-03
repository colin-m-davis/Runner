//
//  LoginView.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        VStack {
            Text("Welcome to Runner")
                .font(.largeTitle)
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
            Button(action : {
                guard !viewModel.email.isEmpty, !viewModel.password.isEmpty else {
                    return
                }
                viewModel.signIn()
            }, label: {
                Text("Log in")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(5)
            })
            if viewModel.requestProcessing {
                Text("Loading...")
            }
            NavigationLink("New user?", destination: RegisterView(viewModel: viewModel))
                .padding()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
