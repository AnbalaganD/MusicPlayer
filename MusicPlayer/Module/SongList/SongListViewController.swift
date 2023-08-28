//
//  SongListViewController.swift
//  MusicPlayer
//
//  Created by anbalagan-8641 on 23/08/23.
//

import UIKit

final class SongListViewController: UIViewController {

    private var songs = [Song]()

    private let songsListTableView = with(UITableView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(SongsListCell.self, forCellReuseIdentifier: SongsListCell.cellReuseIdentifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getSongs()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .white
        title = "Songs"

        songsListTableView.delegate = self
        songsListTableView.dataSource = self
        view.addSubview(songsListTableView)

        songsListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        songsListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        songsListTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        songsListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension SongListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: SongsListCell.cellReuseIdentifier,
            for: indexPath
        ) as! SongsListCell // swiftlint:disable:this force_cast
        cell.setupData(songs[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = SongDetailViewController(song: songs[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension SongListViewController {
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
