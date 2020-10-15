//
//  ContentView.swift
//  watsap
//
//  Created by addjn on 15/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                }
                NavigationLink(destination: RegisterView()) {
                    Text("Register")
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
