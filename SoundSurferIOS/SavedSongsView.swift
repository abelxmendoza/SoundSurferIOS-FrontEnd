import SwiftUI
import Foundation 

struct SavedSongsView: View {
    var likedSongs: [Song]
    @Binding var savedSongs: Set<UUID>

    var body: some View {
        ZStack {
            Color.customTeal.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Saved Songs")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 20)

                ScrollView {
                    ForEach(likedSongs.filter { savedSongs.contains($0.id) }) { song in
                        SongRowView(song: song, isSaved: .constant(true))
                            .padding(.vertical, 4)
                            .background(Color.customTeal)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

