import Foundation

struct Song: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let artist: String
    let albumCover: String
}

