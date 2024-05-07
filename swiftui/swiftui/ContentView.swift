//
//  ContentView.swift
//  swiftui
//
//  Created by Anna Kachkaeva on 07.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State var tapped = false
    @State var animationInProgress = false

    var body: some View {
        Button(action: {
            if !animationInProgress {
                animationInProgress = true
                withAnimation(.interpolatingSpring(stiffness: 100, damping: 14).speed(1.5)) {
                        tapped = true
                } completion: {
                    tapped = false
                    animationInProgress = false
                }
            }
        }, label: {
            HStack(spacing: -4.5) {
                if tapped {
                    Image(systemName: "play.fill")
                        .transition(.scale(.zero))
                }

                Image(systemName: "play.fill")

                if !tapped {
                    Image(systemName: "play.fill")
                        .transition(.scale(.zero))
                }
            }
        })
        .buttonStyle(.plain)
        .font(.largeTitle)
        .foregroundStyle(.cyan)
    }
}

#Preview {
    ContentView()
}
