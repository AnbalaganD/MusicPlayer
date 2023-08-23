//
//  SongsListCell.swift
//  MusicPlayer
//
//  Created by anbalagan-8641 on 23/08/23.
//

import UIKit

final class SongsListCell: UITableViewCell {
    static let cellReuseIdentifier = "SongsListCell"
    
    private let songsNameLabel = with(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(songsNameLabel)
        
        songsNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        songsNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        songsNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        songsNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func setupData(_ song: Song) {
        songsNameLabel.text = song.name
    }
}
