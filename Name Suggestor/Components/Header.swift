/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tran Nguyen Anh Khoa
  ID: s3863956
  Created  date: 07/09/2022
  Last modified: 20/09/2022
  Acknowledgement: Personal coding
*/

import SwiftUI

struct Header: View {
    @State var tabState:Bool
    @EnvironmentObject var env:GlobalEnvironment
    var body: some View {
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
                        Text(env.userName)
                            .foregroundColor(.white)
                            .font(.system(size: 20).weight(.semibold))
                        Spacer()
                }
                    
                    //tabs
                    HStack {
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

struct DiscoverHeader: View{
    @EnvironmentObject var env: GlobalEnvironment
    var body: some View {
        Rectangle()
            .fill(MyColor.header)
            .frame(height: MySize.headerHeight, alignment: .leading)
            .overlay(
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    HStack {
                        Button {
                                //return to main
                            env.currentViewStage = .discover
                            env.tagSelected = 0
                            }
                        label: {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:MySize.height * 0.045)
                                .foregroundColor(.white)
                        }
                        Spacer()
//                        Text((env.currentUser != nil) ? env.currentUser.unsafelyUnwrapped.username! : "Missing")
//                            .foregroundColor(.white)
//                            .font(.system(size: 20).weight(.semibold))
                        Text(env.userName)
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 20).weight(.semibold))
                        ZStack {
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
                    HStack {
                        Text("Discover".uppercased())
                            .foregroundColor(.white)
                            .font(.system(size: 30).weight(.semibold))
                        Spacer()
                        Text(nameTagSample[env.tagSelected])
                            .foregroundColor(.white.opacity(0.4))
                            .font(.system(size: 14).weight(.light))
                    }
                }
                .padding()
            )
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            VStack {
                Header(tabState: true).environmentObject(GlobalEnvironment())
                DiscoverHeader().environmentObject(GlobalEnvironment())
            }
        }
    }
}
