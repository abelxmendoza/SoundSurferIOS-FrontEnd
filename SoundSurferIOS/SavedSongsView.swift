import SwiftUI

struct SavedSongsView: View {
    var likedSongs: [Song]
    @Binding var savedSongs: Set<UUID> // Use Binding to allow changes to propagate back
    
    var body: some View {
        ZStack {
            Color.customTeal.edgesIgnoringSafeArea(.all)  // Using your custom teal color for the background

            VStack {
                Text("Saved Songs")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 20)

                ScrollView {
                    ForEach(likedSongs) { song in
                        SongRowView(song: song, isSaved: .constant(savedSongs.contains(song.id)))
                            .onTapGesture {
                                if savedSongs.contains(song.id) {
                                    savedSongs.remove(song.id)
                                } else {
                                    savedSongs.insert(song.id)
                                }
                            }
                            .padding(.vertical, 4)
                            .background(Color.customTeal)  // Applying custom teal background to each row as well
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct SavedSongsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedSongsView(likedSongs: [Song(name: "Urban Pulse", artist: "City Life", albumCover: "cover1")], savedSongs: .constant(Set()))
    }
}

