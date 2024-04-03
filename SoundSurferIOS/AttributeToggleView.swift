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
        Toggle(title, isOn: $isOn).padding([.leading, .trailing])
    }
}
