//
//  ContentView.swift
//  Name Suggestor
//
//  Created by Khoa on 07/09/2022.
//

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
            NameDiscoverView(content: names)
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
