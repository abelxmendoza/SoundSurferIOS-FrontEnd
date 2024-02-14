struct ContentView: View {
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            if isLoggedIn {
                DashboardView()
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

