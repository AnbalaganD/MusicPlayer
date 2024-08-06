//
//  AudioManager.swift
//  MusicPlayer
//
//  Created by Anbalagan on 19/07/24.
//

import Foundation
import AVFoundation

func fetchInfo(of audioUrl: URL) async throws {
    let asset = AVURLAsset(url: audioUrl)
    let metadata = try await asset.load(.availableMetadataFormats)
    print(metadata)
}
