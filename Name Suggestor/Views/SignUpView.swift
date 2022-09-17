//
//  SignUpView.swift
//  Name Suggestor
//
//  Created by Khoa on 11/09/2022.
//  Modified by Nam on 14/09/2022

import SwiftUI
import CoreData

struct SignUpView: View {
    @State private var name = ""
    @State private var mail = ""
    @State private var pass = ""
    
    @ObservedObject private var controller = Controller()
    @State private var canGoToLoginView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack{
            Background()
                VStack{
                    NavigationLink(destination: SignInView(), isActive: $canGoToLoginView,
                                        label: { EmptyView() })
                    VStack(alignment:.leading,spacing:12){
                        //upper content
                        HStack{
                            Button {}
                            label: {
                                Image(systemName: "arrow.left")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: MySize.height * 0.045)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Button {
                                self.canGoToLoginView = true
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
                            self.canGoToLoginView = true
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
        SignUpView()
    }
}