//
//  NameTypeModel.swift
//  Name Suggestor
//
//  Created by Khoa on 09/09/2022.
//

import Foundation
struct NameType{
    let title:String
    let iconName:String
    let backgroundName:String
    let description:String
    init(t: String, i:String, b: String,d:String)
    {
        title = t
        iconName = i
        backgroundName = b
        description = d
    }
}
