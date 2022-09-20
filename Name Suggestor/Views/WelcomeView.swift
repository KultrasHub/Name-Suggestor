/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tran Nguyen Anh Khoa
  ID: s3863956
  Created  date: 11/09/2022
  Last modified: 14/09/2022
  Acknowledgement: Personal coding
*/

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Background()
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 40)
                    .fill(MyColor.header)
                    .frame(height: MySize.height * 0.65)
                    .overlay(VStack(spacing: 10) {
                        //app icon
                        Spacer()
                        Image("CharacterIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:70)
                        //app name
                        Text("NameHub")
                            .foregroundColor(.white)
                            .font(.system(size: 20).weight(.bold))
                        //intro quote
                        Text("Enjoy looking for ideas, names of characters in your writing or any occasion you are having <3")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14).weight(.thin))
                            .frame(width:MySize.width * 0.7,alignment: .center)
                            .multilineTextAlignment(.center)
                        Spacer()
                        MyButton(content: "Sign In", viewStage:.signIn)
                        MyBorderButton(content: "Sign Up", viewStage: .signUp)
                        Spacer()
                    })
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().environmentObject(GlobalEnvironment())
    }
}
