//
//  CustomNavigationBar.swift
//  SoundSurferIOS
//
import SwiftUI

struct CustomNavigationBar: View {
    var userImage: Image  // User's profile image
    var onLogout: () -> Void  // Closure to handle the logout action

    var body: some View {
        HStack {
            userImage
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)  // Reduced from 50x50 to 40x40
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 3)

            Spacer()

            Button(action: onLogout) {
                Text("Logout")
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)  // Reduced vertical padding to decrease button height
                    .background(Color.red)
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)  // Reduced vertical padding for the whole navigation bar
        .background(Color.customDarkTeal)
        .foregroundColor(.white)
    }
}

