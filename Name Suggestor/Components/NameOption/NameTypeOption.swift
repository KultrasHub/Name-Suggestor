//
//  NameTypeOption.swift
//  Name Suggestor
//
//  Created by Khoa on 07/09/2022.
//

import SwiftUI

struct NameTypeOption: View {
    //background
    let backgroundName:String
    let startColor:Color
    let endColor:Color
    //content
    let iconName:String
    let title:String
    let description:String
    var body: some View {
        Button{}
    label:
        {
            Image(backgroundName)
                .resizable().aspectRatio(contentMode: .fit)
                .overlay(
                    ZStack{
                        //foreground
                        Rectangle().fill(LinearGradient(gradient: Gradient(colors: [startColor.opacity(0.9), endColor.opacity(0.3)]),
                    startPoint: .topTrailing,
                    endPoint: .bottomLeading))
                        //content
                        HStack{
                        VStack(alignment:.leading){
                            Spacer()
                            Image(iconName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                            Text(title)
                                .foregroundColor(.white)
                                .font(.system(size: 20).weight(.bold))
                            Text(description)
                                .foregroundColor(.white.opacity(0.8))
                                .font(.system(size: 14).weight(.light))
                                .multilineTextAlignment(.leading)
                                .frame(width:MySize.width * 0.7)
                            
                        }.padding()
                            Spacer()
                    }
   
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct NameTypeOption_Previews: PreviewProvider {
    static var previews: some View {
        NameTypeOption(backgroundName:"CharacterTab",
                       startColor: MyColor.option_1,
                       endColor: MyColor.option_2,
                       iconName: "CharacterIcon",
                       title: "Character Name",
                       description: "fantasy names like Renly, Brom or scifi names such as Chararbon Molfeli...")
    }
}
