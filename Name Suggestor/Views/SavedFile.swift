//
//  SavedFile.swift
//  Name Suggestor
//
//  Created by Khoa Tran Nguyen Anh on 19/09/2022.
//

import SwiftUI

struct SavedFile: View {
    var body: some View {
        ZStack{
            Background()
            VStack{
                Header(tabState: true)
                
                Spacer()
            }
        }
    }
}

struct SavedFile_Previews: PreviewProvider {
    static var previews: some View {
        SavedFile()
    }
}
