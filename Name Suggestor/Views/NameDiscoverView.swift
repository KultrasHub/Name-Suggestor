//
//  NameDiscoverView.swift
//  Name Suggestor
//
//  Created by Khoa on 10/09/2022.
//

import SwiftUI

struct NameDiscoverView: View {
    let content = [NameModel(id: 0,name: "Tommen", tags: ["Fantasy","Game Of Thrones","Warrior Name"]),
                   NameModel(id: 1,name: "Mias", tags: ["Fantasy","King Name","Warrior Name"]),
                   NameModel(id: 2,name: "Rogboc", tags: ["Fantasy","Orc Name","Middle Earth"]),
                   NameModel(id: 3,name: "Tholvir", tags: ["Fantasy","Drawf Name","Middle Earth"]),
                   NameModel(id: 4,name: "Dryrigg", tags: ["Fantasy","Game Of Thrones"]),
                   NameModel(id: 5,name: "Torgrim", tags: ["Fantasy","Game Of Thrones"]),
                   NameModel(id: 6,name: "Dogvar", tags: ["Fantasy","Game Of Thrones"]),
                   NameModel(id: 7,name: "Dogvar", tags: ["Fantasy","Game Of Thrones"]),
                   NameModel(id: 8,name: "Dogvar", tags: ["Fantasy","Game Of Thrones"]),
                   NameModel(id: 9,name: "Dogvar", tags: ["Fantasy","Game Of Thrones"])]
    var body: some View {
        ZStack{
            Background()
            VStack{
                DiscoverHeader()
                ScrollView{
                ForEach(content)
                {
                    name in
                    NameBox(content: name)
                }
                    
                }
                Spacer()
                //re new button
                Button{}
                label:{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(MyColor.header)
                        .frame(width: MySize.width * 0.55, height: MySize.height * 0.1, alignment: .center)
                        .overlay(
                            Text("Other Names")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 24).weight(.bold))
                        )
                        
                }
            }.padding(.bottom,20)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct NameDiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        NameDiscoverView()
    }
}
