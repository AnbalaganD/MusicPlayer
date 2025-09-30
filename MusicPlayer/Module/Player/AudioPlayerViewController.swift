//
//  AudioPlayerViewController.swift
//  MusicPlayer
//
//  Created by Anbalagan on 22/08/24.
//

import UIKit

final class AudioPlayerViewController: UIViewController {
    private let audioPlayer = AudioPlayer.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func playerConfiguration() {

    }

    @objc private func playAudio() {
        print(#function)
        if audioPlayer.hasPlayerItem {
            audioPlayer.play()
        } else {
            audioPlayer.play("https://rntp.dev/example/Longing.mp3")
        }
    }

    @objc private func pauseAudio() {
        print(#function)
        audioPlayer.pause()
    }
}

private extension AudioPlayerViewController {
    func setupView() {
        view.backgroundColor = .systemBackground

        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        view.addSubview(stackView)

        let buttonConfiguration = UIButton.Configuration.bordered()

        let playButton = UIButton(configuration: buttonConfiguration)
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(.actionText, for: .normal)
        playButton.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        stackView.addArrangedSubview(playButton)

        let pauseButton = UIButton(configuration: buttonConfiguration)
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.setTitleColor(.actionText, for: .normal)
        pauseButton.addTarget(self, action: #selector(pauseAudio), for: .touchUpInside)
        stackView.addArrangedSubview(pauseButton)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeLeadinAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 30),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeBottomAnchor, constant: -30)
        ])
    }
}

// https://rntp.dev/example/Longing.mp3
// https://rntp.dev/example/Soul%20Searching.mp3
// https://rntp.dev/example/Lullaby%20(Demo).mp3
// https://rntp.dev/example/Rhythm%20City%20(Demo).mp3
// https://rntp.dev/example/hls/whip/playlist.m3u8
// https://ais-sa5.cdnstream1.com/b75154_128mp3
// https://traffic.libsyn.com/atpfm/atp545.mp3
