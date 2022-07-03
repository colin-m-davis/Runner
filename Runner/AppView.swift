//
//  ContentView.swift
//  Runner
//
//  Created by Colin Davis on 7/1/22.
//

import SwiftUI

struct AppView: View {
    
    @StateObject var viewModel = AppViewModel()
    
    var body: some View {
        if viewModel.currentUser == nil {
            SignInView()
        } else {
            TicketsView()
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
