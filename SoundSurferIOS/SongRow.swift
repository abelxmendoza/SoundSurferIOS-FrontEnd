import SwiftUI

struct SongRow: View {
    let song: Song

    var body: some View {
        HStack {
            Image(song.albumCover)  // Make sure the album cover names match the assets you've added
                .resizable()
                .scaledToFit()
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

// Preview for SongRow
struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song: Song(name: "Sample Song", artist: "Sample Artist", albumCover: "SampleAlbumCover"))
            .previewLayout(.sizeThatFits)
    }
}

