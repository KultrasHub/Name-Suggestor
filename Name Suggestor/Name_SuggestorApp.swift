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

@main
struct Name_SuggestorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {            
            SplashScreenView()
        }
    }
}
