//
//  SplashScreenView.swift
//  SoundSurferIOS
//
//  Created by Abel Mendoza on 5/6/24.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isActive: Bool
    @State private var scale: CGFloat = 1  // Initial scale for animation

    var body: some View {
        VStack {
            
            Image("soundsurfer2")  // Your app's logo asset name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())  // Clip the image to a circle
                        .scaleEffect(scale)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.5)) {
                                self.scale = 0.5  // End scale for animation
                            }
                        }
            
            Text("SoundSurfer")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isActive = false  // Set to false to hide splash screen
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.customTeal.edgesIgnoringSafeArea(.all))
    }
}

