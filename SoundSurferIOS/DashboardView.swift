import SwiftUI

struct DashboardView: View {
    @State private var songName: String = ""
    @State private var recommendations: [Song] = []
    @Binding var savedSongs: Set<UUID>
    @State private var useTempo: Bool = false
    @State private var useMood: Bool = false
    @State private var useEnergy: Bool = false
    @State private var useDanceability: Bool = false
    @State private var recommendationsMade = false

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
        Song(name: "Regal Ballad", artist: "Orchestra Infinite", albumCover: "ku")
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("soundsurfer2-transparent")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .padding()
                    .frame(maxWidth: .infinity)

                Text("Sound Surfer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding([.top, .leading, .trailing])
                    .frame(maxWidth: .infinity)

                SongSearchView(songName: $songName)

                HStack {
                    VStack {
                        Toggle("Same Tempo", isOn: $useTempo.onChange(updateToggles))
                            .toggleStyle(CustomToggleStyle(onColor: .green, offColor: .gray, thumbColor: .white))
                        Toggle("Same Mood", isOn: $useMood.onChange(updateToggles))
                            .toggleStyle(CustomToggleStyle(onColor: .green, offColor: .gray, thumbColor: .white))
                    }

                    VStack {
                        Toggle("Same Energy", isOn: $useEnergy.onChange(updateToggles))
                            .toggleStyle(CustomToggleStyle(onColor: .green, offColor: .gray, thumbColor: .white))
                        Toggle("Same Genre", isOn: $useDanceability.onChange(updateToggles))
                            .toggleStyle(CustomToggleStyle(onColor: .green, offColor: .gray, thumbColor: .white))
                    }
                }
                .padding()

                HStack {
                    Spacer()
                    Button(recommendationsMade ? "Clear Recommendations" : "Get Recommendations") {
                        if recommendationsMade {
                            recommendations.removeAll()
                            recommendationsMade = false
                        } else {
                            recommendations = dummySongs.shuffled()
                            recommendationsMade = true
                        }
                    }
                    .padding()
                    .background(recommendationsMade ? Color.blue : Color.customDarkTeal)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    Spacer()
                }

                if recommendationsMade {
                    RecommendedPlaylistView(recommendations: $recommendations, savedSongs: $savedSongs)
                }
            }
        }
        .background(Color.customTeal.edgesIgnoringSafeArea(.all))
    }

    private func updateToggles(_ newValue: Bool) {
        let allToggles = [useTempo, useMood, useEnergy, useDanceability]
        let activeCount = allToggles.filter({ $0 }).count
        
        // If activating this toggle would exceed two active toggles
        if activeCount > 2 && newValue {
            if useTempo { useTempo = false }
            else if useMood { useMood = false }
            else if useEnergy { useEnergy = false }
            else if useDanceability { useDanceability = false }
        }
    }
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

