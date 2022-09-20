/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Giang Nhat Khanh
  ID: s3878182
  Created  date: 11/09/2022
  Last modified: 14/09/2022
  Acknowledgement: Personal coding
*/

import SwiftUI

struct SplashScreenView: View {
    @State var isActive: Bool = false
    @State var isAnimated: Bool = false
    var body: some View {
        ZStack {
            // This if statement checks if the Splash Screen is already active in the application,
            // if so, then go straight to the main Game View immediately
            if self.isActive {
                ContentView()
                    .navigationViewStyle(.stack)
                } else {
                    Background()
                    Image("CharacterIcon")
                        .resizable().aspectRatio(contentMode: .fit)
                        .frame(width: MySize.width * 0.3)
                        .scaleEffect(isAnimated ? 0.55 : 2)
                        .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                }
            }
            .onAppear {
                withAnimation (.easeInOut(duration: 1.5)){
                    isAnimated = true
                    
                }
                // On the appearance of the Splash Screen, create a 2-second delay period,
                // in which the Splash Screen will be shown before setting the boolean value to true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    
                        // After the animation is complete, set the active boolean variable to true,
                        // then redirect the player to the main game view
                        withAnimation {
                            self.isActive = true
                        }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
