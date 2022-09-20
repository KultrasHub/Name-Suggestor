//
//  NameDiscoverView.swift
//  Name Suggestor
//
//  Created by Khoa on 10/09/2022.
//

import SwiftUI

struct NameDiscoverView: View {
    let content : [NameModel]
    @State var randomNumber : [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    var body: some View {
        ZStack {
            Background()
            VStack {
                DiscoverHeader()
                ScrollView {
                    ForEach(randomNumber, id: \.self) {
                        number in
                        NameBox(content: content[number])
                    }
//                    ForEach(content) {
//                        name in
//                        NameBox(content: name)
//                    }
                }
                Spacer()
                //re new button
                Button {
                    for i in 0...9 {
                        let randomInt = Int.random(in: 0...(content.count - 1))
                        randomNumber[i] = randomInt
                    }
                }
                label: {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(MyColor.header)
                        .frame(width: MySize.width * 0.55, height: MySize.height * 0.1, alignment: .center)
                        .overlay(
                            Text("Other Names")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 24).weight(.bold))
                        )
                        .shadow(radius: 4)
                        
                }
            }
            .padding(.bottom,20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct NameDiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        NameDiscoverView(content: names)
    }
}
