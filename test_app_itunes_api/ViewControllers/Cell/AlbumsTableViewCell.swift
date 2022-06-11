//
//  AlbumsTableViewCell.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 11.06.2022.
//

import UIKit

class AlbumsTableViewCell: UITableViewCell {

    private let logoImageView: UIImageView = {
       let logoImageView = UIImageView()
        logoImageView.backgroundColor = .red
        logoImageView.clipsToBounds = true
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        return logoImageView
    }()
    
    private let albumNameLabel: UILabel = {
       let albumNameLabel = UILabel()
        albumNameLabel.text = "Name album name"
        albumNameLabel.font = UIFont.systemFont(ofSize: 20)
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return albumNameLabel
    }()
    
    private let artistNameLabel: UILabel = {
        let artistNameLabel = UILabel()
        artistNameLabel.text = "Name artist name"
        artistNameLabel.font = UIFont.systemFont(ofSize: 16)
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
         return artistNameLabel
    }()
    
    private let trackCountLabel: UILabel = {
        let trackCountLabel = UILabel()
        trackCountLabel.text = "16 tracks"
        trackCountLabel.font = UIFont.systemFont(ofSize: 16)
        trackCountLabel.translatesAutoresizingMaskIntoConstraints = false
         return trackCountLabel
    }()
    
    var stackView = UIStackView()

    override func layoutSubviews() {
        super.layoutSubviews()
        logoImageView.layer.cornerRadius = logoImageView.frame.width / 2
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        self.backgroundColor = .white
        self.selectionStyle = .none
        
        self.addSubview(logoImageView)
        self.addSubview(albumNameLabel)
        
        stackView = UIStackView(arrangedSubviews: [artistNameLabel, trackCountLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        self.addSubview(stackView)
    }

    private func setConstraints() {

        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            logoImageView.heightAnchor.constraint(equalToConstant: 60),
            logoImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            albumNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            albumNameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
            albumNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}
