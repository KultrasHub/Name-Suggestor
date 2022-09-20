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
    @EnvironmentObject var savedEnv :SavedEnvironment
    var body: some View {
        Button{
            //update current selected
            if(savedEnv.currentSelected != id)
            {
                savedEnv.updateCurrentSelectedTag(index: id)
            }
        }
        label:{
            RoundedRectangle(cornerRadius: 30)
                .fill((savedEnv.currentSelected == id) ? MyColor.header : Color.clear)
                .frame(width: MySize.width * 0.4, height: MySize.height * 0.05, alignment: .center)
                .overlay(
                Text(content)
                    .font(.system(size: 20).weight(.bold))
                    .foregroundColor((savedEnv.currentSelected == id) ? .white : .white.opacity(0.4))
            )
        }
        
    }
}

struct NameTypeButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Background()
            NameTypeButton(content: "Character",id: 0)
                .environmentObject(SavedEnvironment())
        }
    }
}
