//
//  RecommendedPlaylistView.swift
//  SoundSurferIOS
//
//  Created by Abel Mendoza on 4/2/24.
//


// RecommendedPlaylistView.swift
import SwiftUI

struct RecommendedPlaylistView: View {
    var recommendations: [Song]
    @Binding var savedSongs: Set<UUID>

    var body: some View {
        ScrollView {
            ForEach(recommendations) { song in
                // Create a custom binding for each song
                let isSavedBinding = Binding(
                    get: { self.savedSongs.contains(song.id) },
                    set: { isSaved in
                        if isSaved {
                            self.savedSongs.insert(song.id)
                        } else {
                            self.savedSongs.remove(song.id)
                        }
                    }
                )

                SongRowView(song: song, isSaved: isSavedBinding)
            }
        }
    }
}
