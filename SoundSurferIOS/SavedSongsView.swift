import SwiftUI

struct SavedSongsView: View {
    var body: some View {
        VStack {
            Text("Saved Songs")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)
            
            // Add list of liked songs here
            // You can use a ScrollView with a ForEach loop to display each song
            ScrollView {
                ForEach(likedSongs, id: \.id) { song in
                    // Display song information here
                    Text("\(song.name) - \(song.artist) - \(song.album)")
                }
            }
            .padding(.horizontal)
        }
        .background(Color.teal.opacity(0.1))
    }
}

struct SavedSongsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedSongsView()
    }
}

// Sample data for liked songs
let likedSongs = [
    Song(name: "Song 1", artist: "Artist 1", album: "Album 1"),
    Song(name: "Song 2", artist: "Artist 2", album: "Album 2"),
    Song(name: "Song 3", artist: "Artist 3", album: "Album 3")
]

// Struct to represent a song
struct Song: Identifiable {
    let id = UUID()
    let name: String
    let artist: String
    let album: String
}

