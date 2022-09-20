//
//  SavedNameBox.swift
//  Name Suggestor
//
//  Created by Khoa on 19/09/2022.
//

import SwiftUI
enum DeleteState {case none,asking,delete}
struct SavedNameBox: View {
    var id:Int
    @State var currentText: String = ""
    @State var delete : DeleteState = .none
    @EnvironmentObject var savedEnv:SavedEnvironment
    var body: some View {
        HStack(spacing:15){
            Text(String(id))
            //name
            TextField("edit the name", text: $currentText)
                .foregroundColor(.white)
                .font(.system(size: 20).weight(.light))
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)

            Spacer()
            //edit button
            Button{
                if(currentText != savedEnv.content[id])
                {
                    //only accept if detect change
                    savedEnv.updateNameAtIndex(value: currentText, index: id)
                }
            }
            label:{
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:30)
                    .foregroundColor(.white.opacity(0.2))
            }
            if(delete == .asking)
            {
                Text("Sure?")
                    .font(.system(size: 12).weight(.light))
                    .foregroundColor(.red)
            }
            //delete button
            Button{
                //ask for confirm
                if(delete == .none)
                {
                    //change state to asking
                    delete = .asking
                }
                else if(delete == .asking)
                {
                    //delete and remove this out content, filter
                    savedEnv.removeNameAtIndex(index: id)
                }
            }
            label:{
                Image(systemName: "trash.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:30)
                    .foregroundColor((delete == .asking) ? .red.opacity(0.5) : .white.opacity(0.2))
            }
        }.padding([.leading,.trailing],20)
            .padding([.top,.bottom],10)
            .onAppear{
                self.currentText = savedEnv.content[id]
                //reset delete
                delete = .none
            }
    }
}

struct SavedNameBox_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Background()
            SavedNameBox(id:0).environmentObject(SavedEnvironment(arr: ["Tom the jerrybane","Tom the Cat"]))
        }
    }
}
