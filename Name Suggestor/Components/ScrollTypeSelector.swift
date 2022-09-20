/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tran Nguyen Anh Khoa
  ID: s3863956
  Created  date: 19/09/2022
  Last modified: 20/09/2022
  Acknowledgement: Personal coding
*/

import SwiftUI

struct ScrollTypeSelector: View {
    let nameList = ["Character","Team","Real","Weapon","Pet"]
    @EnvironmentObject var savedEnv : SavedEnvironment
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(nameList.indices,id:\.self){
                    index in
                    NameTypeButton(content: nameList[index], id: index)
                }
            }
        }
    }
}

struct ScrollTypeSelector_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Background()
            ScrollTypeSelector().environmentObject(SavedEnvironment())
        }
    }
}
