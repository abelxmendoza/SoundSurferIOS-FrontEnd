//
//  SongRowView.swift
//  SoundSurferIOS
//
//  Created by Abel Mendoza on 4/2/24.
//


// SongRowView.swift
import SwiftUI

struct SongRowView: View {
    var song: Song
    @Binding var isSaved: Bool

    var body: some View {
        HStack {
            Image(song.albumCover)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(song.name).font(.headline)
                Text(song.artist).font(.subheadline)
            }
            
            Spacer()

            Image(systemName: isSaved ? "heart.fill" : "heart")
                .foregroundColor(isSaved ? .red : .black)
        }
        .padding()
        .foregroundColor(.white)  // Set text color to white
    }
}
