//
//  AudioPlayer.swift
//  MusicPlayer
//
//  Created by Anbalaagn D on 23/08/23.
//

import AVFoundation

extension AudioPlayer {
    struct Config {

    }

    enum State {
        case idle
        case playing(duration: Double)
        case end
        case pause
    }
}

final class AudioPlayer: NSObject, @unchecked Sendable {

    static let shared = AudioPlayer(config: .init())

    var duration: Double = 0.0

    var hasPlayerItem: Bool { player.currentItem != nil }

    var playerState: State = .idle

    private let player = AVPlayer()

    private let config: Config

    private let resourceLoaderQueue = DispatchQueue(
        label: "resource loader queue"
    )

    private let customScheme = "CustomAudioScheme"

    init(config: Config) {
        self.config = config
        super.init()
        initialSetup()
        addTimeObservers()
    }

    func play(_ url: String? = nil) {
        // If url is nil play current item.
        // If current item is nil this function exit without doing anything

        if let url {
            let customSchemeURL = replaceHttpToCustomScheme(url)
            let assetURL = URL(string: customSchemeURL)!
            let asset = AVURLAsset(url: assetURL)
            asset.resourceLoader.setDelegate(
                self,
                queue: resourceLoaderQueue
            )
            let playerItem = AVPlayerItem(asset: asset)
            player.replaceCurrentItem(with: playerItem)
        } else if player.currentItem == nil {
            return
        }
        player.play()
    }

    func pause() {
        player.pause()
    }
}

private extension AudioPlayer {
    func initialSetup() {
        // TODO: Here we can do some intial setup while preparing AudioPlayer
    }

    func addTimeObservers() {
        duration = 1992
        player.addPeriodicTimeObserver(
            forInterval: CMTime.init(seconds: 1, preferredTimescale: 1),
            queue: .main
        ) {[weak self] cmTime in
            guard let self else { return }
            duration = cmTime.seconds
        }
    }

    func replaceHttpToCustomScheme(_ string: String) -> String {
        if string.localizedCaseInsensitiveContains("https") {
            return string.replacingOccurrences(of: "https", with: customScheme)
        }
        return string.replacingOccurrences(of: "http", with: customScheme)
    }
}

extension AudioPlayer: AVAssetResourceLoaderDelegate {
    func resourceLoader(
        _ resourceLoader: AVAssetResourceLoader,
        shouldWaitForLoadingOfRequestedResource loadingRequest: AVAssetResourceLoadingRequest
    ) -> Bool {
        var urlRequest = loadingRequest.request
        guard let urlScheme = urlRequest.url?.scheme else {
            return false
        }

        if urlScheme == customScheme, let url = urlRequest.url?.absoluteString {
            let originalURLString = url.replacingOccurrences(of: customScheme, with: "https")
            let originalURL = URL(string: originalURLString)!
        }

        return true
    }

    func resourceLoader(
        _ resourceLoader: AVAssetResourceLoader,
        shouldWaitForResponseTo authenticationChallenge: URLAuthenticationChallenge
    ) -> Bool {
        return true
    }
}
