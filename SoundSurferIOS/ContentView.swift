import SwiftUI

extension Color {
    static let customTeal = Color(red: 41 / 255.0, green: 168 / 255.0, blue: 151 / 255.0)
    static let customDarkTeal = Color(red: 1 / 255.0, green: 115 / 255.0, blue: 116 / 255.0)
}

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var showingSplash = false  // Initially false, set to true after login
    @State private var selectedTab = 0
    @State private var savedSongs: Set<UUID> = []  // Shared state for saved songs
    @StateObject private var songManager = SongManager.shared

    var body: some View {
        NavigationView {
            VStack {
                if showingSplash {
                    SplashScreenView(isActive: $showingSplash)
                } else if isLoggedIn {
                    // Removing CustomTopBar and using the space for other UI components or just leaving it blank for now
                    TabView(selection: $selectedTab) {
                        DashboardView(savedSongs: $savedSongs)
                            .tabItem {
                                Label("Dashboard", systemImage: "house")
                            }
                            .tag(0)

                        SavedSongsView(likedSongs: songManager.getLikedSongs(), savedSongs: $savedSongs)
                            .tabItem {
                                Label("Liked Songs", systemImage: "heart.fill")
                            }
                            .tag(1)
                    }
                } else {
                    LoginView(onLoginSuccess: {
                        isLoggedIn = true
                        showingSplash = true  // Trigger splash screen right after login
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showingSplash = false  // Close splash screen
                        }
                    })
                }
            }
            .navigationBarHidden(false)  // Optionally hide the navigation bar
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

