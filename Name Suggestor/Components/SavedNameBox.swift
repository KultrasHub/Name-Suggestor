//
//  SavedNameBox.swift
//  Name Suggestor
//
//  Created by Khoa on 19/09/2022.
//

import SwiftUI

struct SavedNameBox: View {
    var content : String
    @State var currentText: String = ""
    init(content:String){
        self.currentText = content
        self.content = content
    }
    var body: some View {
        HStack(spacing:15){
            //name
            TextField(content, text: $currentText)
//                Text(content)
//                    .foregroundColor(.white)
//                    .font(.system(size: 20).weight(.light))

            Spacer()
            //edit button
            Button{
                
            }
            label:{
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:30)
                    .foregroundColor(.white.opacity(0.2))
            }
            //delete button
            Button{}
            label:{
                Image(systemName: "trash.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:30)
                    .foregroundColor(.white.opacity(0.2))
            }
        }.padding([.leading,.trailing],20)
            .padding([.top,.bottom],10)
    }
}

struct SavedNameBox_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Background()
            SavedNameBox(content: "Tom The Jerrybane")
        }
    }
}
