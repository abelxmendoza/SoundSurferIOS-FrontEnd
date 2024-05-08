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
    @Binding var isSaved: Bool  // This tells whether the song is saved
    @StateObject var songManager: SongManager = SongManager.shared

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

            // Toggle the saved state of the song when the button is tapped
            Button(action: toggleSaveStatus) {
                Image(systemName: isSaved ? "heart.fill" : "heart")
                    .foregroundColor(isSaved ? .red : .black)
            }
        }
        .padding()
        .background(isSaved ? Color.white.opacity(0.2) : Color.clear)  // Change background slightly when saved
    }

    // Toggle and save the liked status of the song
    private func toggleSaveStatus() {
        isSaved.toggle()
        songManager.saveLikedSongs(song, isSaved)
    }
}
