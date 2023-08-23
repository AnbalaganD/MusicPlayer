//
//  Song.swift
//  MusicPlayer
//
//  Created by anbalagan-8641 on 23/08/23.
//

import Foundation

struct Song {
    let id: String
    let name: String
    let url: URL
}

//Testing purpose
extension Song {
    static let placeholder = Song(
        id: "111",
        name: "My song",
        url: URL(string: "https://www.kozco.com/tech/piano2.wav")!
        //"https://www.kozco.com/tech/LRMonoPhase4.mp3")!
    )
}
