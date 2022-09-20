//
//  ReadData.swift
//  Name Suggestor
//
//  Created by Long Nguyen on 15/09/2022.
//

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
