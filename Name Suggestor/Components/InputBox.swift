//
//  InputBox.swift
//  Name Suggestor
//
//  Created by Khoa on 11/09/2022.
//  Modified by Nam on 14/09/2022

import SwiftUI

struct InputBox: View {
    func validate(name: String) {
        //transfer content to..
    }
    
    let title: String
    let iconName: String
    
    @Binding var userEmail: String
    @FocusState private var emailFieldIsFocused: Bool
    
    var body: some View {
        VStack(alignment:.leading,spacing: 10) {
            Text(title)
                .foregroundColor(emailFieldIsFocused ? MyColor.option_1 : .white)
                .font(.system(size:16).weight(.light))
            TextField(
                "Email",
                text: $userEmail
            )
            .focused($emailFieldIsFocused)
            .onSubmit {
                validate(name: userEmail)
            }
            .font(.system(size: 18))
            .foregroundColor(.white)
            .frame(width:MySize.width * 0.45, height: MySize.height * 0.025)
            .padding()
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding(4)
            .overlay(
                ZStack(alignment:.leading) {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(emailFieldIsFocused ? MyColor.option_2 : .white, lineWidth: 1)
                        .frame(width:MySize.width * 0.8)
                    Image(systemName: iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: MySize.width * 0.08)
                        .foregroundColor(emailFieldIsFocused ? .white : .white.opacity(0.6))
                        .offset(x: 10)
                }
            )
        }
    }
}

struct PasswordBox: View {
    func validate(name: String) {
        //transfer content to..
    }
    
    let title: String
    let iconName: String
    @Binding var userEmail: String
    @FocusState private var emailFieldIsFocused: Bool
    
    var body: some View {
        VStack(alignment:.leading,spacing: 10) {
            Text(title)
                .foregroundColor(emailFieldIsFocused ? MyColor.option_1 : .white)
                .font(.system(size:16).weight(.light))
            SecureField(
                "Email",
                text: $userEmail
            )
            .focused($emailFieldIsFocused)
            .onSubmit {
                validate(name: userEmail)
            }

            .font(.system(size: 18))
            .foregroundColor(.white)
            .frame(width:MySize.width * 0.45, height: MySize.height * 0.025)
            .padding()
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding(4)
            .overlay(
                ZStack(alignment:.leading) {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(emailFieldIsFocused ? MyColor.option_2 : .white, lineWidth: 1)
                        .frame(width:MySize.width * 0.8)
                    Image(systemName: iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: MySize.width * 0.08)
                        .foregroundColor(emailFieldIsFocused ? .white : .white.opacity(0.6))
                        .offset(x: 10)
                }
            )
        }
    }
}

struct InputBox_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            VStack {
                InputBox(title: "Email", iconName: "person.crop.circle", userEmail: .constant(""))
                PasswordBox(title: "Email", iconName: "person.crop.circle", userEmail: .constant(""))
            }
        }
    }
}
