//
//  Header.swift
//  Name Suggestor
//
//  Created by Khoa on 07/09/2022.
//

import SwiftUI

struct Header: View {
    @State var tabState:Bool
    var body: some View {
        VStack{
        Rectangle()
            .fill(MyColor.header)
            .frame(height: MySize.headerHeight)
            .overlay(
                VStack(alignment:.center,spacing: 20){
                    Spacer()
                    //profile
                    HStack{
                        ZStack{
                        Image("Beereel")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .background(.white.opacity(0.2))
                            .clipShape(Circle())
                            .frame(width: MySize.headerHeight * 0.3)
                        Circle()
                            .stroke(.white,lineWidth: 3)
                            .frame(width: MySize.headerHeight * 0.3,height: MySize.headerHeight*0.3)
                    }
                    Text("Beereel")
                            .foregroundColor(.white)
                            .font(.system(size: 20).weight(.semibold))
                        Spacer()
                }
                    
                    //tabs
                    HStack{
                        TabSelector(content: "discover", state: $tabState)
                        Spacer()
                        OppoTabSelector(content: "saved names", state: $tabState)
                    }
                    
                }.padding([.leading,.trailing],20)
                    .padding(.bottom,10)
            )
            .edgesIgnoringSafeArea(.all)
            //Spacer()
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Background()
            Header(tabState: true)
        }
    }
}
