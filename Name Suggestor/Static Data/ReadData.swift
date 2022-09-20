/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tran Nguyen Anh Khoa, Nguyen Trong Minh Long
  ID: s3863956, s3878694
  Created  date: 15/09/2022
  Last modified: 20/09/2022
  Acknowledgement: Personal coding
*/


import Foundation

var names = decodeJsonFromJsonFile(jsonFileName: "Name.json")
let listNames : [NameModel] = names

func filterNamesByTag(array: [NameModel], tag: String) -> [NameModel] {
    var filteredNames : [NameModel] = []
    // logic filtered:
    for name in array {
        if name.tags[0] == tag {
            filteredNames.append(name)
        }
    }
    // return array of filtered names
    return filteredNames
}
func decodeJsonFromJsonFile(jsonFileName: String) -> [NameModel] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil) {
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([NameModel].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Could not load \(jsonFileName) file")
    }
    return [] as [NameModel]
}
