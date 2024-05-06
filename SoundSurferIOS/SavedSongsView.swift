import SwiftUI

struct SavedSongsView: View {
    var likedSongs: [Song]  // Pass the liked songs into this view

    var body: some View {
        
        
        VStack {
            
            Text("Saved Songs")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)
            
            // Use a ScrollView with a ForEach loop to display each song
            ScrollView {
                ForEach(likedSongs) { song in  // No need to specify id: \.id since Song conforms to Identifiable
                    HStack {
                        // Assuming you have an image with the same name as `albumCover` in your assets
                        Image(song.albumCover)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(5)
                        
                        VStack(alignment: .leading) {
                            Text(song.name)
                                .font(.headline)
                            Text(song.artist)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                    }
                    .padding(.vertical, 4)
                }
                
                
            }
            .padding(.horizontal)
           
        }
        
        
    }
    
    
}

struct SavedSongsView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide sample songs for the preview
        SavedSongsView(likedSongs: [
            Song(name: "Song 1", artist: "Artist 1", albumCover: "AlbumCover1"),
            Song(name: "Song 2", artist: "Artist 2", albumCover: "AlbumCover2"),
            Song(name: "Song 3", artist: "Artist 3", albumCover: "AlbumCover3")
        ])
    }
}


