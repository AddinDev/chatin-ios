//
//  RegisterView.swift
//  watsap
//
//  Created by addjn on 15/10/20.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    @State var isGood = false
    var body: some View {
        VStack {
            NavigationLink(destination: ChatView(), isActive: self.$isGood, label:{ EmptyView()})
            TextField("email", text: $email)
                .padding()
                .background(Color(.systemGray6))
            SecureField("password", text: $password)
                .padding()
                .background(Color(.systemGray6))
            
            Button("Register") {
                Auth.auth().createUser(withEmail: self.email, password: self.password) { (result, error) in
                    if error != nil {
                        print(error?.localizedDescription ?? "ewow")
                    } else {
                        self.isGood = true
                    }
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
