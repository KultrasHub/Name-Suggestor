/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author:  Nguyen Trong Minh Long
  ID: s3863956, s3878694
  Created  date: 11/09/2022
  Last modified: 11/09/2022
  Acknowledgement: Personal coding
*/

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
