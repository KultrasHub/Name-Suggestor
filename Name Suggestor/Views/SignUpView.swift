/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tran Nguyen Anh Khoa, Nguyen Phan Nam
  ID: s3863956,  s3873792
  Created  date: 11/09/2022
  Last modified: 20/09/2022
  Acknowledgement: Personal coding
*/

import SwiftUI
import CoreData

struct SignUpView: View {
    @State private var name = ""
    @State private var mail = ""
    @State private var pass = ""
    
    @ObservedObject private var controller = Controller()
    @EnvironmentObject var env:GlobalEnvironment
    var body: some View {
        NavigationView {
            ZStack{
            Background()
                VStack{
                    VStack(alignment:.leading,spacing:12){
                        //upper content
                        HStack{
                            Button {
                                env.currentViewStage = .welcome
                            }
                            label: {
                                Image(systemName: "arrow.left")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: MySize.height * 0.045)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Button {
                                env.currentViewStage = .signIn
                            }
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
                                InputBox(title: "Username", iconName: "person.crop.circle", userEmail: $name)
                                InputBox(title: "Email", iconName: "bubble.left.circle", userEmail: $mail)
                                PasswordBox(title: "Password", iconName: "lock.circle", userEmail: $pass)
                                Spacer()
                                Button {
                                    controller.addUser(name: name, pass: pass, email: mail)
                                } label: {
                                    RoundedRectangle(cornerRadius: 40)
                                        .fill(.white)
                                        .overlay(
                                            Text("Create Account".uppercased())
                                                .foregroundColor(MyColor.background)
                                                .font(.system(size: 20).weight(.bold))
                                        )
                                        .frame(width: MySize.width * 0.8, height: MySize.height * 0.06, alignment: .center)
                                }
                                Spacer()
                                Spacer()
                            }
                        )
                }
                .alert(item: $controller.alertItem) { alertItem in
                    Alert(title: alertItem.title,
                          message: alertItem.message,
                          dismissButton: .default(alertItem.buttonTitle, action: {
                        if alertItem.id == 5 {
                            //GO TO SIGN IN
                            env.lastVisited = .signUp
                            env.currentViewStage = .signIn
                        }
                    }))
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(GlobalEnvironment())
    }
}
