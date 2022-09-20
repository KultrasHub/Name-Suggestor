//
//  NameBox.swift
//  Name Suggestor
//
//  Created by Khoa on 10/09/2022.
//  Modified by Long on 11/09/2022

import SwiftUI

struct NameBox: View {
    let userDefaults = UserDefaults.standard
    var content: NameModel
    @State var savedNames : [String] = []
    @State var savedTags : [String] = []
    @State var savedCheck : Bool = false
    var body: some View {
        HStack {
            //name
            VStack(alignment:.leading) {
                Text(content.name)
                    .foregroundColor(.white)
                    .font(.system(size: 20).weight(.light))
                Text(content.getTag())
                    .foregroundColor(.white.opacity(0.4))
                    .font(.system(size: 14).weight(.thin))
            }
            Spacer()
            //add a text saved if an element is saved
            if(savedCheck)
            {
                Text("SAVED")
                    .font(.system(size: 16).weight(.thin))
                    .foregroundColor(.red.opacity(0.8))
            }
            //save button
            Button {
                if(!savedCheck)
                {
                    // get data from userDefaults
                    guard
                        let nameData = userDefaults.stringArray(forKey: nameKey) ,
                        let tagData = userDefaults.stringArray(forKey: tagKey)
                    else{
                        //nothing in name or tag
                        savedNames.append(content.name)
                        savedTags.append(content.tags[0])
                        //save to user default
                        userDefaults.set(savedNames,forKey: nameKey)
                        userDefaults.set(savedTags,forKey: tagKey)
                        savedCheck = true
                        return
                    }
                    //else
                    savedNames = nameData
                    savedTags = tagData
                    //assign value first
                    savedNames.append(content.name)
                    savedTags.append(content.tags[0])
                    //save to user default
                    userDefaults.set(savedNames,forKey: nameKey)
                    userDefaults.set(savedTags,forKey: tagKey)
                    savedCheck = true
                }
            }
            label: {
                Image(systemName: "heart.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:30)
                    .foregroundColor((savedCheck) ? .red : .white.opacity(0.2))
            }
        }
        .padding([.leading,.trailing],20)
        .padding([.top,.bottom],10)
    }
}

struct NameBox_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            NameBox(content: NameModel(id: 0, name: "Tommen Baratheon", tags: ["fantasy","king name", "game of thrones"]))
        }
    }
}
