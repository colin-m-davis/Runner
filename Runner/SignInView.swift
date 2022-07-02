//
//  LoginView.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var authState : AuthState
    
    var body: some View {
        VStack {
            Text("Welcome to Runner")
                .font(.largeTitle)
            TextField("Email Address", text: $email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            Button(action : {
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                authState.signIn(email: email, password: password)
            }, label: {
                Text("Log in")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(5)
            })
            if authState.requestProcessing {
                Text("Loading...")
            }
            NavigationLink("New user?", destination: RegisterView(email: $email, password: $password))
                .padding()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(email: "user", password: "pass")
    }
}
