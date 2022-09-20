//
//  ScrollTypeSelector.swift
//  Name Suggestor
//
//  Created by Khoa on 19/09/2022.
//

import SwiftUI

struct ScrollTypeSelector: View {
    let nameList = ["Character","Team","Real","Weapon","Pet"]
    @EnvironmentObject var savedEnv : SavedEnvironment
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(nameList.indices,id:\.self){
                    index in
                    NameTypeButton(content: nameList[index], id: index)
                }
            }
        }
    }
}

struct ScrollTypeSelector_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Background()
            ScrollTypeSelector().environmentObject(SavedEnvironment())
        }
    }
}
