/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tran Nguyen Anh Khoa, Nguyen Trong Minh Long
  ID: s3863956, s3878694
  Created  date: 11/09/2022
  Last modified: 14/09/2022
  Acknowledgement: Personal coding
*/


import SwiftUI

struct DiscoverView: View {
    var body: some View {
        ZStack{
            Background()
            VStack{
                Header(tabState: true).edgesIgnoringSafeArea(.top)
                Spacer()
                NameTypeLayout().edgesIgnoringSafeArea(.all)
                Spacer()
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
