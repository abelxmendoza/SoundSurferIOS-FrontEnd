import SwiftUI

struct DashboardView: View {
    @State private var songName: String = ""
    @State private var recommendedSongs: [String] = ["Song 1", "Song 2", "Song 3", "Song 4", "Song 5", "Song 6", "Song 7", "Song 8", "Song 9", "Song 10", "Song 11", "Song 12"]

    var body: some View {
        NavigationView {
            VStack {
                // Navigation Bar
                VStack {
                    Text("Sound Surfer")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    TextField("Enter a song name", text: $songName)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                }
                .background(Color(UIColor.systemBackground))
                
                // Dashboard Content
                Text("Dashboard")
                    .font(.title)
                    .padding()

                // Recommended Songs List
                List(recommendedSongs, id: \.self) { song in
                    Text(song)
                        .padding(.vertical, 5)
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .navigationBarTitle("Dashboard")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
