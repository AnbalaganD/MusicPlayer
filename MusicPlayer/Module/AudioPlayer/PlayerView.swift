//
//  PlayerView.swift
//  MusicPlayer
//
//  Created by Anbalaagn D on 23/08/23.
//

import AVFoundation
import UIKit

final class PlayerView: UIView {
    override class var layerClass: AnyClass { AVPlayerLayer.self }

    // swiftlint:disable:next force_cast
    private var playerLayer: AVPlayerLayer { layer as! AVPlayerLayer }

    var player: AVPlayer? {
        get { playerLayer.player }
        set { playerLayer.player = newValue }
    }
}
