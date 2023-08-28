//
//  SongDetailViewController.swift
//  MusicPlayer
//
//  Created by anbalagan-8641 on 23/08/23.
//

import UIKit
import AVFoundation

final class SongDetailViewController: UIViewController {

    private let audioPlayerView = with(AudioPlayerView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .gray
    }

    private let playOrPauseButton = with(UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }

    private let song: Song
    init(song: Song) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setPlayerURL()
    }

    private func setupView() {
        view.backgroundColor = .white
        title = "Song Detail"

        view.addSubview(audioPlayerView)

        audioPlayerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        audioPlayerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        audioPlayerView.topAnchor.constraint(equalTo: view.safeTopAnchor).isActive = true
        audioPlayerView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        view.addSubview(playOrPauseButton)
        playOrPauseButton.addTarget(self, action: #selector(handlePlayOrPause), for: .touchUpInside)
        playOrPauseButton.centerXAnchor.constraint(equalTo: audioPlayerView.centerXAnchor).isActive = true
        playOrPauseButton.centerYAnchor.constraint(equalTo: audioPlayerView.centerYAnchor).isActive = true
        playOrPauseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        playOrPauseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setPlayerURL() {
        audioPlayerView.setURL(song.url)
    }

    @objc private func handlePlayOrPause() {
        defer { updatePlayOrPauseButtonStatus() }

        guard let isPlaying = audioPlayerView.isPlaying else {
            return audioPlayerView.play()
        }

        if isPlaying {
            audioPlayerView.pause()
        } else {
            audioPlayerView.resume()
        }
    }

    private func updatePlayOrPauseButtonStatus() {
        guard let isPlaying = audioPlayerView.isPlaying else {
            playOrPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            return
        }

        let imageName = isPlaying ? "pause.fill" : "play.fill"
        playOrPauseButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
