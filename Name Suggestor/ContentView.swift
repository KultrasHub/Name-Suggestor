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
import Swift

struct ContentView: View {
    @StateObject var env = GlobalEnvironment()
    
    var body: some View {
        if(env.currentViewStage == .welcome)
        {
            WelcomeView()
                .environmentObject(env)
        }
        else if (env.currentViewStage == .signIn)
        {
            SignInView()
                .environmentObject(env)
        }
        else if (env.currentViewStage == .signUp)
        {
            SignUpView()
                .environmentObject(env)
        }
        else if(env.currentViewStage == .discover)
        {
            DiscoverView()
                .environmentObject(env)
        }
        else if(env.currentViewStage == .nameDiscover)
        {
            NameDiscoverView(content: filterNamesByTag(array: names, tag: nameTagSample[env.tagSelected]))
                .environmentObject(env)
        }
        else if (env.currentViewStage == .saved)
        {
            SavedFile()
                .environmentObject(env)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
