import Foundation

class SongManager: ObservableObject {
    static let shared = SongManager() // Singleton instance to be used across the app

    @Published private var likedSongs: [Song] = [] // Array of liked songs, observable

    // Save or remove a song based on the isSaved flag
    func saveLikedSongs(_ song: Song, _ isSaved: Bool) {
        DispatchQueue.main.async {
            if isSaved {
                // Add song to the list if it is not already present
                if !self.likedSongs.contains(where: { $0.id == song.id }) {
                    self.likedSongs.append(song)
                }
            } else {
                // Remove song from the list based on unique identifier
                self.likedSongs.removeAll { $0.id == song.id }
            }
            // Debug print to check the current list of liked songs
            debugPrint(self.likedSongs)
        }
    }

    // Retrieve the list of currently liked songs
    func getLikedSongs() -> [Song] {
        return likedSongs
    }
}

