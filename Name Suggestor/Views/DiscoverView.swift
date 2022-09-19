//
//  DiscoverView.swift
//  Name Suggestor
//
//  Created by Khoa Tran Nguyen Anh on 19/09/2022.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        ZStack{
            Background()
            VStack{
                Header(tabState: true)
                NameTypeLayout()
                Spacer()
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}