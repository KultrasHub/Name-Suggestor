//
//  SavedFile.swift
//  Name Suggestor
//
//  Created by Khoa Tran Nguyen Anh on 19/09/2022.
//
import Swift
import SwiftUI

struct SavedFile: View {
    @StateObject var savedEnv : SavedEnvironment = SavedEnvironment()
    

    var body: some View {
        ZStack{
            Background()
            VStack{
                Header(tabState: false)
                ScrollTypeSelector().environmentObject(savedEnv)
                ScrollView{
                    ForEach(savedEnv.filterList,id: \.self)
                    {
                        index in
                        SavedNameBox(id: index).environmentObject(savedEnv)
                    }
                    
                }
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
            .onAppear{
                //get name and tags from
                guard
                    let nameData = UserDefaults.standard.stringArray(forKey: nameKey),
                    let tagData = UserDefaults.standard.stringArray(forKey: tagKey)
                else {return}
                //content is filter based on nameData with tag Data
                savedEnv.content = nameData
                savedEnv.tags = tagData
                //on starting get filter data based on character
                savedEnv.updateCurrentSelectedTag(index: 0)
            }
    }
        
}

struct SavedFile_Previews: PreviewProvider {
    static var previews: some View {
        SavedFile()
    }
}
