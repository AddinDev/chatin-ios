//
//  Networking.swift
//  watsap
//
//  Created by addjn on 15/10/20.
//

import Foundation
import Firebase

class Networking: ObservableObject {
    @Published var messages = [Message]()
    let db = Firestore.firestore()

    func loadMessages() {
        db.collection("messages").order(by: "date").addSnapshotListener { (querySnapshot, error) in
            
            self.messages = []
            
            if error != nil {
                print(error?.localizedDescription ?? "ewow")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let sender = data["sender"] as? String, let body = data["body"] as? String {
                            let newMessage = Message(sender: sender, body: body)
                            self.messages.append(newMessage)
                        }
                    }
                }
            }
        }
        
    }
    
}
