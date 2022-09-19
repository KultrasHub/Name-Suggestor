//
//  Button.swift
//  Name Suggestor
//
//  Created by Khoa on 11/09/2022.
//

import SwiftUI

struct MyButton: View {
    let content: String
    var body: some View {
        Button {}
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
    var body: some View {
        Button {}
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
                MyButton(content: "Sign In")
                MyBorderButton(content: "Sign Up")
            }
        }
    }
}
