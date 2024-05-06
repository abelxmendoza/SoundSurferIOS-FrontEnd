//
//  CustomToggleStyle.swift
//  SoundSurferIOS
//
//  Created by Abel Mendoza on 5/5/24.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    var onColor: Color
    var offColor: Color
    var thumbColor: Color

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            RoundedRectangle(cornerRadius: 16)
                .fill(configuration.isOn ? onColor : offColor)
                .frame(width: 50, height: 26)
                .overlay(
                    Circle()
                        .fill(thumbColor)
                        .padding(.all, 3)
                        .offset(x: configuration.isOn ? 12 : -12, y: 0)
                )
                .animation(.easeInOut, value: configuration.isOn)
                .onTapGesture { configuration.isOn.toggle() }
        }
        .padding(.horizontal)
    }
}
