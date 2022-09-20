//
//  ViewController.swift
//  Name Suggestor
//
//  Created by Khoa on 19/09/2022.
//

import Foundation
enum ViewPage{case welcome,signUp,signIn,discover,nameDiscover,saved};
let nameTagSample = ["","Fantasy", "Business", "Real Name","Weapon Name","Pet Name"]
class GlobalEnvironment: ObservableObject{
    @Published var currentViewStage:ViewPage = .welcome
    @Published var lastVisited : ViewPage = .welcome
    @Published var tagSelected: Int = 0
    //@Published var currentUser: UserInfo? = nil
    @Published var userName:String = ""
    init()
    {
        currentViewStage = .welcome
    }
    
}

class SavedEnvironment: ObservableObject{
    @Published var currentSelected:Int = 0
    @Published var content:[String] = []
    @Published var tags:[String] = []
    //
    @Published var filterList:[Int] = []
    init()
    {}
    init(arr:[String])
    {
        content = arr
    }
    //filter content that match the selected tag
    func updateCurrentSelectedTag(index: Int) {
        //
        currentSelected = index
        let selectedTag = nameTagSample[currentSelected + 1]//name tag has empty zero at start while current selected has not
        //reset the filter list
        filterList.removeAll()
        for i in 0...tags.count-1{
            if(tags[i] == selectedTag)
            {
                //same tag
                filterList.append(i)
            }
        }
    }
    //edit content
    func updateNameAtIndex(value: String, index: Int)
    {
        content[index] = value
        //save to user default
        UserDefaults.standard.set(content, forKey: nameKey)
    }
    //remove at index
    func removeNameAtIndex(index: Int)
    {
        content.remove(at: index)
        tags.remove(at: index)
        if let removeIndex = filterList.firstIndex(of: index)
        {
            filterList.remove(at: removeIndex)
        }
        UserDefaults.standard.set(content, forKey: nameKey)
        UserDefaults.standard.set(tags,forKey: tagKey)
    }
}
