//
//  DetailAlbumViewController.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 11.06.2022.
//

import UIKit

class DetailAlbumViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let albumLogoView: UIImageView = {
        let albumLogoView = UIImageView()
        albumLogoView.backgroundColor = .red
        albumLogoView.translatesAutoresizingMaskIntoConstraints = false
        return albumLogoView
    }()
    
    private let albumNameLabel: UILabel = {
        let albumNameLabel = UILabel()
        albumNameLabel.numberOfLines = 0
        albumNameLabel.text = "Album Name"
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return albumNameLabel
    }()
    
    private let artistNameLabel: UILabel = {
        let artistNameLabel = UILabel()
        artistNameLabel.text = "Artist Name"
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return artistNameLabel
    }()
    
    private let releaseDateLabel: UILabel = {
        let releaseDateLabel = UILabel()
        releaseDateLabel.text = "Release date"
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        return releaseDateLabel
    }()
    
    private let trackCountLabel: UILabel = {
        let trackCountLabel = UILabel()
        trackCountLabel.text = "10 tracks"
        trackCountLabel.translatesAutoresizingMaskIntoConstraints = false
        return trackCountLabel
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.bounces = false
        collectionView.register(SongsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(albumLogoView)
        
        stackView = UIStackView(arrangedSubviews: [albumNameLabel,artistNameLabel,releaseDateLabel,trackCountLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        
        view.addSubview(stackView)
        view.addSubview(collectionView)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SongsCollectionViewCell
        cell.songNameLabel.text = "Song Name"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: collectionView.frame.width,
            height: 20
        )
    }
    
}


//MARK: - SetConstraints

extension DetailAlbumViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            albumLogoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            albumLogoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            albumLogoView.heightAnchor.constraint(equalToConstant: 100),
            albumLogoView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: albumLogoView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: albumLogoView.trailingAnchor, constant: 17),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}

