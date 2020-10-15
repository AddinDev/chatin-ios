//
//  ChatView.swift
//  watsap
//
//  Created by addjn on 15/10/20.
//

import SwiftUI
import Firebase

struct ChatView: View {
    @State var message = ""
    @ObservedObject var networking = Networking()
    let db = Firestore.firestore()

    var body: some View {
        VStack {
            List(networking.messages) { msg in
                if msg.sender == Auth.auth().currentUser?.email {
                    MessageList(msg: msg, img: "vedo")
                } else {
                    MessageList(msg: msg, img: "forestedited")

                }
            }
            HStack {
                TextField("type", text: $message)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                Button(action: {
                    
                    let messageSender = Auth.auth().currentUser?.email
                    db.collection("messages").addDocument(data: ["sender": messageSender, "body": self.message, "date": Date().timeIntervalSince1970]) { (error) in
                        if error != nil {
                            print(error?.localizedDescription)
                        } else {
                            print("success")
                        }
                    }
                    
                    
                }) {
                    Image(systemName: "arrow.up.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(8)
                }
                
            }
            .padding()
        }
        .navigationBarHidden(true)
        .onAppear {
            self.networking.loadMessages()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
