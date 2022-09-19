//
//  ViewController.swift
//  Name Suggestor
//
//  Created by Khoa on 19/09/2022.
//

import Foundation
enum ViewPage{case welcome,signUp,signIn,discover,nameDiscover,saved};
let nameTagSample = ["","Character Name", "Team Name", "Real Name"," Weapon Name","Pet Name"]
class GlobalEnvironment: ObservableObject{
    @Published var currentViewStage:ViewPage = .welcome
    @Published var lastVisited : ViewPage = .welcome
    @Published var tagSelected: Int = 0
    init()
    {
        currentViewStage = .welcome
    }
}
