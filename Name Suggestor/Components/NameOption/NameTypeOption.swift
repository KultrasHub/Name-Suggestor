//
//  NameTypeOption.swift
//  Name Suggestor
//
//  Created by Khoa on 07/09/2022.
//

import SwiftUI

struct NameTypeOption: View {
    //background
    let startColor:Color
    let endColor:Color
    //content
    let type:NameType
    var body: some View {
        Button{}
    label:
        {
            Image(type.backgroundName)
                .resizable()
                //.frame(width: MySize.width * 0.9, height: MySize.height * 0.15)
                //.aspectRatio(contentMode: .fit)
                .overlay(
                    ZStack{
                        //foreground
                        Rectangle().fill(LinearGradient(gradient: Gradient(colors: [startColor.opacity(0.9), endColor.opacity(0.5)]),
                    startPoint: .topTrailing,
                    endPoint: .bottomLeading))
                        //content
                        HStack{
                        VStack(alignment:.leading){
                            Spacer()
                            Image(type.iconName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                            Text(type.title)
                                .foregroundColor(.white)
                                .font(.system(size: 20).weight(.bold))
                            Text(type.description)
                                .foregroundColor(.white.opacity(0.8))
                                .font(.system(size: 12).weight(.light))
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

struct NameTypeOption2: View {
    //background
    let startColor:Color
    let endColor:Color
    //content
    let type:NameType
    var body: some View {
        Button{}
    label:
        {
            Image(type.backgroundName)
                .resizable()
                //.frame(width: MySize.width * 0.9, height: MySize.height * 0.15)
                //.aspectRatio(contentMode: .fit)
                .overlay(
                    ZStack{
                        //foreground
                        Rectangle().fill(LinearGradient(gradient: Gradient(colors: [startColor.opacity(0.7), endColor.opacity(0.3)]),
                    startPoint: .topTrailing,
                    endPoint: .bottomLeading))
                        
                        //content
                        HStack{
                        VStack(alignment:.leading){
                            Spacer()
                            Image(type.iconName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                            Text(type.title)
                                .foregroundColor(.white)
                                .font(.system(size: 20).weight(.bold))
                            Text(type.description)
                                .foregroundColor(.white.opacity(0.8))
                                .font(.system(size: 12).weight(.light))
                                .multilineTextAlignment(.leading)
                            
                        }.padding()
                    }
   
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                //.frame(width: MySize.width * 0.45, height: MySize.height * 0.2)
        }
    }
}
struct NameTypeOption_Previews: PreviewProvider {
    static var previews: some View {
        NameTypeOption2(
                       startColor: MyColor.option_1,
                       endColor: MyColor.option_2,
                       type: NameType(t: "Character Name",
                                      i: "CharacterIcon",
                                      b: "CharacterTab",
                                      d: "fantasy names like Renly, Brom or scifi names such as Chararbon Molfeli..."))
    }
}
