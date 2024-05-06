import SwiftUI

struct DashboardView: View {
    @State private var songName: String = ""
    @State private var recommendations: [Song] = []
    @Binding var savedSongs: Set<UUID>  // Add this line to accept savedSongs
    //@State private var savedSongs: Set<UUID> = []
    @State private var useTempo: Bool = false
    @State private var useMood: Bool = false
    @State private var useEnergy: Bool = false
    @State private var useDanceability: Bool = false

    let dummySongs = [
        Song(name: "Song A", artist: "Artist A", albumCover: "9139-Lamb-of-God-Killadelphia-872461540"),
        Song(name: "Song B", artist: "Artist B", albumCover: "ku"),
        Song(name: "Epic Journey", artist: "The Wanderers", albumCover: "hypsoad"),
        Song(name: "Rising Sun", artist: "Eastern Whispers", albumCover: "ku"),
        Song(name: "Deep Dive", artist: "Ocean Echoes", albumCover: "ku"),
        Song(name: "Desert Mirage", artist: "Sandy Tracks", albumCover: "ku"),
        Song(name: "Night Drive", artist: "Neon Dreams", albumCover: "ku"),
        Song(name: "Misty Mountains", artist: "Highland Hymns", albumCover: "ku"),
        Song(name: "Urban Pulse", artist: "City Life", albumCover: "hypsoad"),
        Song(name: "Country Roads", artist: "Rustic Tunes", albumCover: "hypsoad"),
        Song(name: "Retro Vibes", artist: "Vintage Sounds", albumCover: "hypsoad"),
        Song(name: "Regal Ballad", artist: "Orchestra Infinite", albumCover: "ku"),
        // ... continue with your pattern
    ]

    var body: some View {
          NavigationView {
              ScrollView {
                  VStack(alignment: .leading) {
                      HStack {
                              Spacer() // Pushes the content to the center horizontally
                              Image("soundsurfer2") // Replace with your image name
                                  .resizable() // Make the image resizable
                                  .frame(width: 150, height: 150)
                                  .aspectRatio(contentMode: .fill) // Keep the image aspect ratio
                                  .clipped() // Clip the image to its bounding frame
                                  .padding() // Add some padding if needed
                              Spacer() // Pushes the content to the center horizontally
                          }

                      
                      HStack {
                              Spacer() // Pushes the content to the center horizontally
                              Text("Sound Surfer")
                                  .font(.largeTitle)
                                  .fontWeight(.bold)
                                  .padding([.top, .leading, .trailing])
                              Spacer() // Pushes the content to the center horizontally
                          }
                      SongSearchView(songName: $songName)
                      
                      //AttributeToggleView(title: "Use Tempo", isOn: $useTempo)
                      //AttributeToggleView(title: "Use Mood", isOn: $useMood)
                      //AttributeToggleView(title: "Use Energy", isOn: $useEnergy)
                      //AttributeToggleView(title: "Use Danceability", isOn: $useDanceability)
                      
                      HStack {
                                  VStack {
                                      AttributeToggleView(title: "Use Tempo", isOn: $useTempo)
                                      AttributeToggleView(title: "Use Mood", isOn: $useMood)
                                  }
                                 // .padding(.trailing, 20) // Optional: Adds some space between the two columns

                                  VStack {
                                      AttributeToggleView(title: "Use Energy", isOn: $useEnergy)
                                      AttributeToggleView(title: "Use Danceability", isOn: $useDanceability)
                                  }
                              }
                              .padding()  // Add padding around the entire HStack for better spacing from container edges
                      
                      
                      RecommendationButtonView {
                          self.recommendations = dummySongs.shuffled()
                      }
                      
                      RecommendedPlaylistView(recommendations: recommendations, savedSongs: $savedSongs)
                  }
              }
              .navigationBarTitle("Dashboard", displayMode: .inline)
              .navigationBarHidden(true)
              .background(Color.customTeal.edgesIgnoringSafeArea(.all)) // Apply the custom teal as a background to the whole view
          }
      }
  }

  struct DashboardView_Previews: PreviewProvider {
      static var previews: some View {
          DashboardView(savedSongs: .constant(Set()))
      }
  }
