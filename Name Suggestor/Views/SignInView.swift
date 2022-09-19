//
//  SignInView.swift
//  Name Suggestor
//
//  Created by Khoa on 11/09/2022.
//  Modified by Nam on 14/09/2022

import SwiftUI

struct SignInView: View {
    
    @State private var name = ""
    @State private var pass = ""
    
    @ObservedObject private var controller = Controller()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
        Background()
            VStack {
                VStack(alignment:.leading,spacing:12) {
                    //upper content
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        }
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
                            Text("Sign Up")
                                .foregroundColor(MyColor.option_1.opacity(0.9))
                        }
                    }
                    //title
                    Text("Sign In".uppercased())
                        .foregroundColor(.white)
                        .font(.system(size: 20).weight(.bold))
                        .tracking(2)
                    Text("Log in to save and edit your favourite names!")
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
                    .overlay(VStack(spacing: 10) {
                        Spacer()
                        Spacer()
                        InputBox(title: "Username", iconName: "person.crop.circle", userEmail: $name)
                        PasswordBox(title: "Password", iconName: "lock.circle", userEmail: $pass)
                        Spacer()
                        Button {
                            controller.checkUserCanLogin(name: name, pass: pass)
                        } label: {
                            RoundedRectangle(cornerRadius: 40)
                                .fill(.white)
                                .overlay(
                                    Text("Sign in".uppercased())
                                        .foregroundColor(MyColor.background)
                                        .font(.system(size: 20).weight(.bold))
                                )
                                .frame(width: MySize.width * 0.8, height: MySize.height * 0.06, alignment: .center)
                        }

                        Spacer()
                        Spacer()
                    })
            }
            .alert(item: $controller.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle, action: {
                    //TODO: NPNAM: xu ly khi login thanh cong
                }))
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
