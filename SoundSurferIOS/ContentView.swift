import SwiftUI

extension Color {
    static let customTeal = Color(red: 41 / 255.0, green: 168 / 255.0, blue: 151 / 255.0)
    static let customDarkTeal = Color(red: 1 / 255.0, green: 115 / 255.0, blue: 116 / 255.0)
}

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var selectedTab = 0
    @State private var savedSongs: Set<UUID> = []  // Shared state for saved songs

    var body: some View {
        NavigationView {
            if isLoggedIn {
                // TabView for Dashboard and Liked Songs
                TabView(selection: $selectedTab) {
                    DashboardView(savedSongs: $savedSongs)  // Pass the Binding to DashboardView
                        .tabItem {
                            Label("Dashboard", systemImage: "house")
                        }
                        .tag(0)

                    SavedSongsView(likedSongs: [], savedSongs: $savedSongs)  // Pass the Binding to SavedSongsView
                        .tabItem {
                            Label("Liked Songs", systemImage: "heart.fill")
                        }
                        .tag(1)
                }
            } else {
                LoginView(onLoginSuccess: {
                    self.isLoggedIn = true
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

