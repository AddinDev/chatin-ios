//
//  MessageList.swift
//  watsap
//
//  Created by addjn on 15/10/20.
//

import SwiftUI
import Firebase

struct MessageList: View {
    var msg: Message
    var img: String
    var body: some View {
        HStack {
            if msg.sender != Auth.auth().currentUser?.email {
                Image(img)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .cornerRadius(35)
                    .aspectRatio(contentMode: .fill)
                VStack(alignment: .leading) {
                    Text(msg.sender).font(.callout)
                    Text(msg.body)
                }
            }
           Spacer()
            if msg.sender == Auth.auth().currentUser?.email {
                VStack(alignment: .trailing) {
                    Text(msg.sender).font(.callout)
                    Text(msg.body)
                }
                Image(img)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .cornerRadius(35)
                    .aspectRatio(contentMode: .fill)

            }
        }
    }
}

