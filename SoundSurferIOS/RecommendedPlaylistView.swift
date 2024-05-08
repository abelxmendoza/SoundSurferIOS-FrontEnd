//
//  RecommendedPlaylistView.swift
//  SoundSurferIOS
//
//  Created by Abel Mendoza on 4/2/24.
//


// RecommendedPlaylistView.swift
import SwiftUI

struct RecommendedPlaylistView: View {
    @Binding var recommendations: [Song]
    @Binding var savedSongs: Set<UUID>

    var body: some View {
        VStack {
            ScrollView {
                ForEach(recommendations.filter { !savedSongs.contains($0.id) }, id: \.id) { song in
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
            
            /*
             Button("Clear Recommendations") {
             // Clears the list of recommendations
             recommendations.removeAll()
             }
             .padding()
             .background(Color.red)
             .foregroundColor(.white)
             .cornerRadius(8)
             
             */
        }
    }
}
