//
//  ReadData.swift
//  Name Suggestor
//
//  Created by Long Nguyen on 17/09/2022.
//

import Foundation
//
//  ReadData.swift
//  Name Suggestor
//
//  Created by Long Nguyen on 15/09/2022.
//
import Foundation

var namesData = decodeJsonFromJsonFile(jsonFileName: "NameData.json")

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
