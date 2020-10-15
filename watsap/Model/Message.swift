//
//  Message.swift
//  watsap
//
//  Created by addjn on 15/10/20.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    let sender: String
    let body: String
}
