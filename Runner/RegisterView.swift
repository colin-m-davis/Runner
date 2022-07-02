//
//  LoginView.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import SwiftUI

struct RegisterView: View {
    @Binding var email : String
    @Binding var password : String
    
    @State var verifypassword = ""
    @State var signUpErrorMessage = ""
    
    @EnvironmentObject var authState : AuthState
    @ObservedObject var db : FirestoreManager = FirestoreManager()
    
    var body: some View {
        VStack {
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
            SecureField("Verify Password", text: $verifypassword)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            Button(action : {
                guard !email.isEmpty, !password.isEmpty, password == verifypassword else {
                    return
                }
                authState.register(email: email, password: password)

            }, label: {
                Text("Create account")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .cornerRadius(5)
            })
            if authState.requestProcessing {
                Text("Loading...")
            }
        }
        .padding()
        .navigationTitle("Create Account")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(email: .constant("New User"), password: .constant("New Pass"))
    }
}
