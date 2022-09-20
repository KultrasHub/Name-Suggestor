/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tran Nguyen Anh Khoa
  ID: s3863956
  Created  date: 10/09/2022
  Acknowledgement: Personal coding
*/
import Foundation
struct NameModel: Identifiable, Codable {
    let id: Int
    let name: String
    let tags: [String]
    
    init(id: Int, name: String, tags: [String]) {
        self.id = id
        self.name = name
        self.tags = tags
    }
    func getTag() -> String {
        var result = ""
        for tag in tags {
            result = result + tag + ", " 
        }
        return result
    }
}
