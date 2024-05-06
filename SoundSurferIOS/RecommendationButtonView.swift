//
//  RecommendationButtonView.swift
//  SoundSurferIOS
//
//  Created by Abel Mendoza on 4/2/24.
//

import SwiftUI

struct RecommendationButtonView: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Get Recommendations")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.customDarkTeal)
                .cornerRadius(10)
        }
        .padding([.leading, .trailing])
    }
}
