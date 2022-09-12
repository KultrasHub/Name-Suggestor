//
//  NameBox.swift
//  Name Suggestor
//
//  Created by Khoa on 10/09/2022.
//

import SwiftUI

struct NameBox: View {
    var content: NameModel
    
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
            Button{}
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
