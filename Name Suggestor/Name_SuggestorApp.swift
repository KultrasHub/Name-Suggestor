//
//  Name_SuggestorApp.swift
//  Name Suggestor
//
//  Created by Khoa on 07/09/2022.
//

import SwiftUI

@main
struct Name_SuggestorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            SignUpView()
                .environment(\.colorScheme, .light)
        }
    }
}
