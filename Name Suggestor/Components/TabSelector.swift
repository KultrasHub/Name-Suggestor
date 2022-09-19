//
//  TabSelector.swift
//  Name Suggestor
//
//  Created by Khoa on 07/09/2022.
//

import SwiftUI

struct TabSelector: View {
    let content: String
    @Binding var state: Bool
    @EnvironmentObject var env:GlobalEnvironment
    var body: some View {
        Button {
            if(!state) {
                state = !state
                if(env.tagSelected == 0)
                {
                    env.currentViewStage = .discover
                }
                else{
                    env.currentViewStage = .nameDiscover
                }
            }
        }
        label: {
            VStack(spacing: 5) {
                Text(content.uppercased())
                    .foregroundColor(state ? .white : .white.opacity(0.5))
                    .font(.system(size: 20).weight(.regular))
                //selected bar
                    RoundedRectangle(cornerRadius: 30)
                        .fill(state ? .white : .clear)
                        .frame(width: MySize.width * 0.4, height: 5, alignment: .center)
            }
        }
    }
}

struct OppoTabSelector: View {
    let content: String
    @Binding var state: Bool
    @EnvironmentObject var env:GlobalEnvironment
    var body: some View {
        Button {
            if(state) {
                state = !state
                env.currentViewStage = .saved
            }
        }
        label: {
            VStack(spacing: 5) {
                Text(content.uppercased())
                    .foregroundColor(!state ? .white : .white.opacity(0.5))
                    .font(.system(size: 20).weight(.regular))
                //selected bar
                RoundedRectangle(cornerRadius: 30)
                    .fill(!state ? .white : .clear)
                    .frame(width: MySize.width*0.4, height: 5, alignment: .center)
                
            }
        }
    }
}

struct TabSelector_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            HStack {
                TabSelector(content: "Discover",state: .constant(true))
                    .environmentObject(GlobalEnvironment())
                OppoTabSelector(content: "Discover",state: .constant(true))
                    .environmentObject(GlobalEnvironment())
            }
        }
    }
}
