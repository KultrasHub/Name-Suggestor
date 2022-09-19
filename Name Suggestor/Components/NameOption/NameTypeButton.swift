//
//  NameTypeButton.swift
//  Name Suggestor
//
//  Created by Khoa on 19/09/2022.
//

import SwiftUI

struct NameTypeButton: View {
    let content:String
    let id:Int
    @Binding var currentSelected:Int
    var body: some View {
        Button{
            //update current selected
            if(currentSelected != id)
            {
                currentSelected = id
            }
        }
        label:{
            RoundedRectangle(cornerRadius: 30)
                .fill((currentSelected == id) ? MyColor.header : Color.clear)
                .frame(width: MySize.width * 0.4, height: MySize.height * 0.05, alignment: .center)
                .overlay(
                Text(content)
                    .font(.system(size: 20).weight(.bold))
                    .foregroundColor((currentSelected == id) ? .white : .white.opacity(0.4))
            )
        }
        
    }
}

struct NameTypeButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Background()
            NameTypeButton(content: "Character",id: 0,currentSelected:.constant(1))
        }
    }
}
