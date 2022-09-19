//
//  User.swift
//  Name Suggestor
//
//  Created by Long Nguyen on 11/09/2022.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let username: String;
    let password: String;
    let email: String;
    init(username: String, password: String, email: String) {
        self.username = username;
        self.password = password;
        self.email = email;
    }
}
