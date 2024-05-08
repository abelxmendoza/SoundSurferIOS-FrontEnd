import SwiftUI

struct SavedSongsView: View {
    var likedSongs: [Song]
    @Binding var savedSongs: Set<UUID>  // This Set tracks which songs are liked

    var body: some View {
        ZStack {
            Color.customTeal.edgesIgnoringSafeArea(.all)  // Background color extends to screen edges
            VStack {
                Text("Saved Songs")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 20)

                ScrollView {
                    // Displaying songs in reverse order to ensure the first liked songs appear at the bottom
                    ForEach(Array(likedSongs.filter { savedSongs.contains($0.id) }.reversed()), id: \.id) { song in
                        SongRowView(song: song, isSaved: Binding(
                            get: { savedSongs.contains(song.id) },
                            set: { newValue in
                                if newValue {
                                    savedSongs.insert(song.id)
                                } else {
                                    savedSongs.remove(song.id)
                                }
                            }
                        ))
                        .padding(.vertical, 4)
                        .background(Color.customTeal)
                        .cornerRadius(5) // Optional: Adds rounded corners to each song row for better UI
                        .shadow(radius: 2) // Optional: Adds subtle shadow for depth
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

