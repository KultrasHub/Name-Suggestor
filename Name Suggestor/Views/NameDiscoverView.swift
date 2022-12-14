/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tran Nguyen Anh Khoa, Nguyen Trong Minh Long
  ID: s3863956
  Created  date: 09/09/2022
  Last modified: 14/09/2022
  Acknowledgement: Personal coding
*/

import SwiftUI

struct NameDiscoverView: View {
    let content : [NameModel]
    @State var randomNumber : [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @EnvironmentObject var env:GlobalEnvironment
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
                }
                Spacer()
                //re new button
                Button {
                    // Random function
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
        NameDiscoverView(content: filterNamesByTag(array: names, tag: "Gaming"))
            .environmentObject(GlobalEnvironment())
    }
}
