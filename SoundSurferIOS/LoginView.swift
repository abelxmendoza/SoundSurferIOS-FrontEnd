import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var onLoginSuccess: () -> Void  // Closure to be called when login is successful

    var body: some View {
        VStack {
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

            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 50)

            Button(action: {
                // This is where you would handle the authentication logic.
                // For now, we'll just call the onLoginSuccess closure to simulate a successful login.
                onLoginSuccess()
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
        LoginView(onLoginSuccess: {})
    }
}

