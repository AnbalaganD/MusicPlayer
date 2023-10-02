//
//  SongListViewModel.swift
//  MusicPlayer
//
//  Created by anbalagan-8641 on 05/09/23.
//

import Foundation

final class SongListViewModel {
    @Published private(set) var songs = [Song]()

    init() {
//        getSongs()
    }
}

extension SongListViewModel {
    func getSongs() {
        songs.append(contentsOf: [
            .placeholder,
            .placeholder,
            .placeholder,
            .placeholder,
            .placeholder
        ])
    }
}
