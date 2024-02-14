import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 50)
            
            TextField("Username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal, 50)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal, 50)
                .padding(.bottom, 20)
            
            Button(action: {
                // Add login logic here
                print("Logging in...")
            }) {
                HStack {
                    Image("spotify-icon") // Use your Spotify icon image here
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Login with Spotify")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green) // Use Spotify's green color here
                .cornerRadius(10)
                .padding(.horizontal, 50)
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
