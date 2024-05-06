//
//  AttributeToggleView.swift
//  SoundSurferIOS
//
//  Created by Abel Mendoza on 4/2/24.
//

import SwiftUI




struct AttributeToggleView: View {
    var title: String
    @Binding var isOn: Bool

    var body: some View {
        Toggle(title, isOn: $isOn)
            .toggleStyle(CustomToggleStyle(onColor: .customDarkTeal, offColor: Color.gray.opacity(0.5), thumbColor: Color.white))
            .padding([.leading, .trailing])
    }
}
