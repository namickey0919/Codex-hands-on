import Foundation
import AVFoundation

@MainActor
final class PlayerViewModel: ObservableObject {
    private var player = AVQueuePlayer()

    func playShuffle(songs: [Song]) {
        player.removeAllItems()
        let shuffled = songs.shuffled()
        for song in shuffled {
            if let url = song.previewURL {
                player.insert(AVPlayerItem(url: url), after: nil)
            }
        }
        player.play()
    }
}
