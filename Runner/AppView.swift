//
//  ContentView.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import SwiftUI

struct AppView: View {
    
    @EnvironmentObject var authState : AuthState
    
    var body: some View {
        NavigationView {
            if authState.isSignedIn {
                TicketListView()
            } else {
                SignInView()
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
