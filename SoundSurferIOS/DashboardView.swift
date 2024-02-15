
import SwiftUI

struct DashboardView: View {
    @State private var songName: String = ""
    @State private var recommendations: [Song] = []  // This will hold the list of recommended songs.
    @State private var savedSongs: Set<UUID> = []  // Using a Set for efficient lookups
    
    // Dummy data for song recommendations
    let dummySongs = [
        Song(name: "Song A", artist: "Artist A", albumCover: "AlbumCoverA"),
        Song(name: "Song B", artist: "Artist B", albumCover: "AlbumCoverB"),
        // ... add more dummy songs as needed
    ]
    
    var body: some View {
        NavigationView {  // Wrap your content in a NavigationView
            VStack {
                // Navigation Bar Title
                Text("Sound Surfer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 16)
                
                Text("Enter a song and get a recommended playlist.")
                    .font(.subheadline)
                    .padding(.bottom, 20)
                
                // Song Name Input
                TextField("Enter a song name", text: $songName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 24)
                
                // Get Recommendations Button
                Button(action: {
                    self.recommendations = dummySongs.shuffled()
                }) {
                    Text("Get Recommendations")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                }
                
                // Recommended Playlist Section
                Text("Recommended Playlist")
                    .font(.headline)
                    .padding(.top, 20)
                
                // List of recommended songs
                ScrollView {
                    ForEach(recommendations) { song in
                        HStack {
                            Image(song.albumCover)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .cornerRadius(5)
                            
                            VStack(alignment: .leading) {
                                Text(song.name)
                                    .font(.headline)
                                Text(song.artist)
                                    .font(.subheadline)
                            }
                            
                            Spacer()
                            
                            // Heart-shaped like button
                            Button(action: {
                                if self.savedSongs.contains(song.id) {
                                    self.savedSongs.remove(song.id)
                                } else {
                                    self.savedSongs.insert(song.id)
                                }
                            }) {
                                Image(systemName: self.savedSongs.contains(song.id) ? "heart.fill" : "heart")
                                    .foregroundColor(self.savedSongs.contains(song.id) ? .red : .gray)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }

                // Navigation Link to SavedSongsView
                NavigationLink(destination: SavedSongsView(likedSongs: recommendations.filter { savedSongs.contains($0.id) })) {
                    Text("View Saved Songs")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.top, 20)  // Add padding to space it out from the list
            }
            .padding(.bottom, 50)
            .navigationBarTitle("Dashboard", displayMode: .inline)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
