//
//  NameTypeLayout.swift
//  Name Suggestor
//
//  Created by Khoa on 09/09/2022.
//

import SwiftUI

struct NameTypeLayout: View {
    //sample models
    let models = [NameType(t: "Character Name", i: "CharacterIcon", b: "CharacterTab", d: "fantasy names like Renly, Brom or scifi names such as Chararbon Molfeli..."),
                  NameType(t: "Team Name", i: "TeamIcon", b: "TeamTab", d: "you might like Office Heroes or Desk Champions..."),
                  NameType(t: "Real Name", i: "RealIcon", b: "RealTab", d: "Olivia, Emma, Amelia, Liam, Nikola, Noah and more"),
                  NameType(t: "Weapon Name", i: "WeaponIcon", b: "WeaponTab", d: "witness the Heartbane, Widow Wail, Storm Edge or modern name such as Spencer carbine"),
                  NameType(t: "Pet Name", i: "PetIcon", b: "PetTab", d: "From cutie like daisy, teddy, candy or legends like Thor")]
    var body: some View {
        VStack(spacing: MySize.width * 0.03){
            NameTypeOption(startColor: MyColor.option_1, endColor: MyColor.option_2, type: models[0])
                .frame(width: MySize.width * 0.95, height: MySize.height * 0.15)
            HStack(alignment: .top,spacing: MySize.width * 0.03){
                //left
                VStack(spacing: MySize.width * 0.03){
                    NameTypeOption2(startColor: MyColor.option_2, endColor: MyColor.option_3, type: models[1])
                        .frame(width: MySize.width * 0.45, height: MySize.height * 0.2)
                    NameTypeOption2(startColor: MyColor.option_3, endColor: MyColor.option_4, type: models[3])
                        .frame(width: MySize.width * 0.45, height: MySize.height * 0.3)
                }
                //right
                VStack(spacing: MySize.width * 0.03){
                    NameTypeOption2(startColor: MyColor.option_2, endColor: MyColor.option_3, type: models[2])
                        .frame(width: MySize.width * 0.45, height: MySize.height * 0.3)
                    NameTypeOption2(startColor: MyColor.option_3, endColor: MyColor.option_4, type: models[4])
                        .frame(width: MySize.width * 0.45, height: MySize.height * 0.2)
                }
            }
            Spacer()
        }
        .padding([.leading,.trailing],5)
    }
}

struct NameTypeLayout_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Background()
            VStack{
                Header(tabState: true)
                NameTypeLayout()
                Spacer()
            }
        }
    }
}
