//
//  SongListViewController.swift
//  MusicPlayer
//
//  Created by Anbalaagn D on 23/08/23.
//

import UIKit
import Combine

final class SongListViewController: UIViewController {
    private let viewModel = SongListViewModel()
    private var subscriptions = Set<AnyCancellable>()

    private let songsListTableView = with(UITableView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(SongsListCell.self, forCellReuseIdentifier: SongsListCell.cellReuseIdentifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
        viewModel.getSongs()
    }

    private func bindViewModel() {
        viewModel.$songs
            .sink {[weak self] songs in
                print(self?.viewModel.songs ?? "")
                print(songs)
            }
            .store(in: &subscriptions)
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
        viewModel.songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: SongsListCell.cellReuseIdentifier,
            for: indexPath
        ) as! SongsListCell // swiftlint:disable:this force_cast
        cell.setupData(viewModel.songs[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = SongDetailViewController(song: viewModel.songs[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

@propertyWrapper
struct Bind<Value> {
    var wrappedValue: Value
    
    var projectedValue: CurrentValueSubject<Value, Never> {
        CurrentValueSubject(wrappedValue)
    }
}
