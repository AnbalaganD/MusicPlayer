//
//  AudioPlayer.swift
//  MusicPlayer
//
//  Created by Anbalaagn D on 23/08/23.
//

import AVFoundation
import UIKit

final class AudioPlayerView: UIView {
    private let player: AVPlayer

    private(set) var isPlaying: Bool?
    private(set) var status: PlayerStatus = .unknown

    init(player: AVPlayer = AVPlayer()) {
        self.player = player
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Basic functionality of Audio player
extension AudioPlayerView {
    func setURL(_ url: URL) {
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
    }

    func play() {
        player.play()
    }

    func pause() {
        player.pause()
    }

    func resume() {
        player.play()
    }
}
