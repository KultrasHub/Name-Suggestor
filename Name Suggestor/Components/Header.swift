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
                            .stroke( AngularGradient(gradient: Gradient(colors: [MyColor.option_1, MyColor.option_2, MyColor.option_3, MyColor.option_4, MyColor.option_1]), center: .center, startAngle: .degrees(360), endAngle: .zero),lineWidth: 3)
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
            .edgesIgnoringSafeArea(.top)
            //Spacer()
        }
    }
}
struct DiscoverHeader:View{
    
    var body: some View {
        Rectangle()
            .fill(MyColor.header)
            .frame(height: MySize.headerHeight,alignment: .leading)
            .overlay(
                VStack(alignment:.leading,spacing: 0){
                    Spacer()
                    HStack{
                    Button{
                            //return to main
                        }
                    label:{
                        Image(systemName: "arrow.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:MySize.height * 0.045)
                            .foregroundColor(.white)
                    }
                        Spacer()
                        Text("Beereel")
                                .foregroundColor(.white)
                                .font(.system(size: 20).weight(.semibold))
                        ZStack{
                        Image("Beereel")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .background(.white.opacity(0.2))
                            .clipShape(Circle())
                            .frame(width: MySize.headerHeight * 0.3)
                        Circle()
                                .stroke( AngularGradient(gradient: Gradient(colors: [MyColor.option_1, MyColor.option_2, MyColor.option_3, MyColor.option_4, MyColor.option_1]), center: .center, startAngle: .zero, endAngle: .degrees(360)),lineWidth: 3)
                            .frame(width: MySize.headerHeight * 0.3,height: MySize.headerHeight*0.3)
                        }
                    }
                    Spacer()
                    HStack{
                        Text("Discover".uppercased())
                            .foregroundColor(.white )
                            .font(.system(size: 30).weight(.semibold))
                        Spacer()
                        Text("Character Name")
                            .foregroundColor(.white.opacity(0.4) )
                            .font(.system(size: 14).weight(.light))
                    }
                }
                    .padding()
            )
    }
}
struct Header_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Background()
            VStack{
            Header(tabState: true)
            DiscoverHeader()
            }
        }
    }
}
