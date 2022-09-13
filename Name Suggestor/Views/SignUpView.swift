//
//  SignUpView.swift
//  Name Suggestor
//
//  Created by Khoa on 11/09/2022.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        ZStack{
        Background()
            VStack{
                VStack(alignment:.leading,spacing:12){
                    //upper content
                    HStack{
                        Button {}
                        label: {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:MySize.height * 0.045)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Button {}
                        label: {
                            Text("Sign In")
                                .foregroundColor(MyColor.option_1.opacity(0.9))
                        }
                    }
                    //title
                    Text("Sign Up".uppercased())
                        .foregroundColor(.white)
                        .font(.system(size: 20).weight(.bold))
                        .tracking(2)
                    Text("Create an account to gain access to more interesting features!")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 16).weight(.thin))
                        .frame(width:MySize.width * 0.7)
                        .multilineTextAlignment(.leading)
                }
                .padding([.leading,.trailing])
                Spacer()
                RoundedRectangle(cornerRadius: 40)
                    .fill(MyColor.header)
                    .frame(height: MySize.height * 0.7)
                    .overlay(
                        VStack(spacing: 10) {
                            Spacer()
                            Spacer()
                            InputBox(title: "Username", iconName: "person.crop.circle")
                            InputBox(title: "Email", iconName: "bubble.left.circle")
                            PasswordBox(title: "Password", iconName: "lock.circle")
                            Spacer()
                            MyButton(content: "Create Account")
                            Spacer()
                            Spacer()
                        }
                    )
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
