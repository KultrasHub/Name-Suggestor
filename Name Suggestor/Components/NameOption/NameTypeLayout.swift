/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tran Nguyen Anh Khoa
  ID: s3863956
  Created  date: 07/09/2022
  Last modified: 09/09/2022
  Acknowledgement: Personal coding
*/

import SwiftUI

struct NameTypeLayout: View {

    
    //sample models
    let models = [NameType(t: "Character Name", i: "CharacterIcon", b: "CharacterTab", d: "fantasy names like Renly, Brom or scifi names such as Chararbon Molfeli..."),
                  NameType(t: "Team Name", i: "TeamIcon", b: "Teamtab", d: "you might like Office Heroes or Desk Champions..."),
                  NameType(t: "Real Name", i: "RealIcon", b: "RealTab", d: "Olivia, Emma, Amelia, Liam, Nikola, Noah and more"),
                  NameType(t: "Weapon Name", i: "WeaponIcon", b: "WeaponTab", d: "witness the Heartbane, Widow Wail, Storm Edge or modern name such as Spencer carbine"),
                  NameType(t: "Pet Name", i: "PetIcon", b: "PetTab", d: "From cutie like daisy, teddy, candy or legends like Thor")]
    @EnvironmentObject var env: GlobalEnvironment
    var body: some View {
        VStack(spacing: MySize.width * 0.03) {
            Button{
                env.currentViewStage = .nameDiscover
                env.tagSelected = 1
            }
        label:{
            NameTypeOption(startColor: MyColor.option_1, endColor: MyColor.option_2, type: models[0])
                .frame(width: MySize.width * 0.95, height: MySize.height * 0.15)
        }
            HStack(alignment: .top,spacing: MySize.width * 0.03) {
                //left
                VStack(spacing: MySize.width * 0.03) {
                    Button{
                        env.currentViewStage = .nameDiscover
                        env.tagSelected = 2
                    }
                label:{
                    NameTypeOption2(startColor: MyColor.option_2, endColor: MyColor.option_3, type: models[1])
                        .frame(width: MySize.width * 0.45, height: MySize.height * 0.2)
                }
                    Button{
                        env.currentViewStage = .nameDiscover
                        env.tagSelected = 4
                    }
                label:{
                    NameTypeOption2(startColor: MyColor.option_3, endColor: MyColor.option_4, type: models[3])
                        .frame(width: MySize.width * 0.45, height: MySize.height * 0.3)
                }
                }
                //right
                VStack(spacing: MySize.width * 0.03) {
                    
                    Button{
                        env.currentViewStage = .nameDiscover
                        env.tagSelected = 3
                    }
                label:{
                    NameTypeOption2(startColor: MyColor.option_2, endColor: MyColor.option_3, type: models[2])
                        .frame(width: MySize.width * 0.45, height: MySize.height * 0.3)
                }
                    //
                    Button{
                        env.currentViewStage = .nameDiscover
                        env.tagSelected = 5
                    }
                label:{
                    NameTypeOption2(startColor: MyColor.option_3, endColor: MyColor.option_4, type: models[4])
                        .frame(width: MySize.width * 0.45, height: MySize.height * 0.2)
                }
                }
            }
            //Spacer()
        }
        .padding([.leading,.trailing],5)
    }
}

struct NameTypeLayout_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            VStack{
                //Header(tabState: true)
                NameTypeLayout()
                //Spacer()
            }
        }
    }
}
