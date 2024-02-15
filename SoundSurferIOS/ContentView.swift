import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            if isLoggedIn {
                DashboardView()
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

