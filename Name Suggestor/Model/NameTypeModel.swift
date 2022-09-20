/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tran Nguyen Anh Khoa
  ID: s3863956
  Created  date: 09/09/2022
  Last modified: 09/09/2022
  Acknowledgement: Personal coding
*/

import Foundation
struct NameType {
    let title: String
    let iconName: String
    let backgroundName: String
    let description: String
    init(t: String, i: String, b: String,d: String) {
        title = t
        iconName = i
        backgroundName = b
        description = d
    }
}
