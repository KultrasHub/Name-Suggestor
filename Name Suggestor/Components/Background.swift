/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Tran Nguyen Anh Khoa
  ID: s3863956
  Created  date: 07/09/2022
  Last modified: 07/09/2022
  Acknowledgement: Personal coding
*/

import SwiftUI

struct Background: View {
    var body: some View {
        MyColor.background
            .edgesIgnoringSafeArea(.all)
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
