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
    private var boundaryTimeObserverToken: Any?

    init(player: AVPlayer = AVPlayer()) {
        self.player = player
        super.init(frame: .zero)
        addPeriodicTimeObserver()
        setAds()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addPeriodicTimeObserver() {
        player.addPeriodicTimeObserver(
            forInterval: CMTime(seconds: 1, preferredTimescale: 1),
            queue: nil
        ) { time in
            print(time.seconds)
            print(Thread.current)
        }
    }

    private func setAds() {
        boundaryTimeObserverToken = player.addBoundaryTimeObserver(
            forTimes: [
                NSValue(time: CMTime(seconds: 10, preferredTimescale: 1)),
                NSValue(time: CMTime(seconds: 20, preferredTimescale: 1)),
                NSValue(time: CMTime(seconds: 30, preferredTimescale: 1)),
                NSValue(time: CMTime(seconds: 40, preferredTimescale: 1)),
                NSValue(time: CMTime(seconds: 50, preferredTimescale: 1)),
                NSValue(time: CMTime(seconds: 60, preferredTimescale: 1))
            ],
            queue: nil) {[weak self] in
                print("Show ads here")
                guard let self else { return }
                player.pause()
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    self.player.play()
                }
            }
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
