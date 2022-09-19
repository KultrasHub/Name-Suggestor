//
//  SavedFile.swift
//  Name Suggestor
//
//  Created by Khoa Tran Nguyen Anh on 19/09/2022.
//

import SwiftUI

struct SavedFile: View {
    @State var currentSelected:Int = 0
    let content = ["Tommen StormBorn","Lala LightningCounter","Irelia"]
    var body: some View {
        ZStack{
            Background()
            VStack{
                Header(tabState: false)
                ScrollTypeSelector(currentSelected: $currentSelected)
                ScrollView{
                    ForEach(content,id: \.self)
                    {
                        name in
                        SavedNameBox(content: name)
                    }
                    
                }
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SavedFile_Previews: PreviewProvider {
    static var previews: some View {
        SavedFile()
    }
}
