//
//  SongSearchView.swift
//  SoundSurferIOS
//
//  Created by Abel Mendoza on 4/2/24.
//

import SwiftUI

struct SongSearchView: View {
    @Binding var songName: String

    var body: some View {
        TextField("Enter a song name", text: $songName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding([.leading, .trailing])
    }
}
