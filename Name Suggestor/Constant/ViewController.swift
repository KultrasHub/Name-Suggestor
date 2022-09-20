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
    @Published var filterList:[Int] = []
    @Published var size = 0
    init()
    {}
    init(arr:[String])
    {
        content = arr
        size = content.count
    }
    //filter content that match the selected tag
    func updateCurrentSelectedTag(index: Int) {
        //
        currentSelected = index
        let selectedTag = nameTagSample[currentSelected + 1]//name tag has empty zero at start while current selected has not
        //reset the filter list
        filterList.removeAll()
        if(tags.count == 0)
        {
            return
        }
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
        //
        if(index >= content.count)
        {
            updateCurrentSelectedTag(index: currentSelected)
            return
        }
        content.remove(at: index)
        tags.remove(at: index)
        //updateCurrentSelectedTag(index: currentSelected)
        if(filterList.count == 1)
        {
            filterList.removeAll()
            return
        }
        
        for i in 0...filterList.count-2
        {
            if(filterList[i] >= index)
            {
                filterList[i] = filterList[i+1]
            }
        }

        filterList.removeLast()
        UserDefaults.standard.set(content, forKey: nameKey)
        UserDefaults.standard.set(tags,forKey: tagKey)
    }
}
