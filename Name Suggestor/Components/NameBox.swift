//
//  NameBox.swift
//  Name Suggestor
//
//  Created by Khoa on 10/09/2022.
//

import SwiftUI

struct NameBox: View {
    let userDefaults = UserDefaults.standard
    var content: NameModel
    @State var savedNames : [String] = []
    @State var savedTags : [String] = []
    
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
            //save button
            Button {
                if let unsortData = userDefaults.stringArray(forKey: "savedNames") {
                    savedNames = unsortData
                    if !savedNames.contains(content.name) {
                        savedNames.append(content.name)
                        if let unsortData = userDefaults.stringArray(forKey: "savedTags") {
                            savedTags = unsortData
                            
                            savedTags.append(content.name)
                        }
                    }
                }

//                savedNames.append(content.name)
//                savedTags.append(content.tags[0])
//                userDefaults.set(savedNames, forKey: "savedNames")
//                userDefaults.set(savedTags, forKey: "savedTags")
                
            }
            label: {
                Image(systemName: "heart.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:30)
                    .foregroundColor(.white.opacity(0.2))
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
