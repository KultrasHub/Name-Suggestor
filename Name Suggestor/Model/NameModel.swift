//
//  NameModel.swift
//  Name Suggestor
//
//  Created by Khoa on 10/09/2022.
//

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
