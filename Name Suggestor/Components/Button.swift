/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tran Nguyen Anh Khoa, Nguyen Trong Minh Long
  ID: s3863956, s3878694
  Created  date: 07/09/2022
  Last modified: 09/09/2022
  Acknowledgement: Personal coding
*/

import SwiftUI

struct MyButton: View {
    let content: String
    let viewStage:ViewPage
    @EnvironmentObject var env:GlobalEnvironment
    var body: some View {
        Button {
            if(env.currentViewStage != viewStage)
            {
                env.currentViewStage = viewStage
                env.lastVisited = .welcome
            }
        }
        label: {
            RoundedRectangle(cornerRadius: 40)
                .fill(.white)
                .overlay(
                    Text(content.uppercased())
                        .foregroundColor(MyColor.background)
                        .font(.system(size: 20).weight(.bold))
                )
                .frame(width: MySize.width * 0.8, height: MySize.height * 0.06, alignment: .center)
        }
    }
}

struct MyBorderButton: View {
    let content: String
    let viewStage:ViewPage
    @EnvironmentObject var env:GlobalEnvironment
    var body: some View {
        Button {
            if(env.currentViewStage != viewStage)
            {
                env.currentViewStage = viewStage
                env.lastVisited = .welcome
            }
        }
        label: {
            RoundedRectangle(cornerRadius: 40)
                .stroke(.white,lineWidth: 2)
                .overlay(
                    Text(content.uppercased())
                        .foregroundColor(.white)
                        .font(.system(size: 20).weight(.bold))
                )
                .frame(width: MySize.width * 0.8, height: MySize.height * 0.06, alignment: .center)
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            VStack {
                MyButton(content: "Sign In", viewStage:.signIn )
                MyBorderButton(content: "Sign Up", viewStage:.signUp)
            }
        }
    }
}
