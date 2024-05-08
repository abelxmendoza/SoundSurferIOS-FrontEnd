//
//  CustomTopBar.swift
//  SoundSurferIOS
//
//  Created by Abel Mendoza on 5/7/24.
//

import SwiftUI

struct CustomTopBar: View {
    var userImage: Image
    var onLogout: () -> Void

    var body: some View {
        HStack {
            userImage
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 3)

            Spacer()

            Button(action: onLogout) {
                Text("Logout")
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.red)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.customDarkTeal) // Use your custom color
        .foregroundColor(.white)
    }
}
