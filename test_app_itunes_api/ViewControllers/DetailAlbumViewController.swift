//
//  DetailAlbumViewController.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 11.06.2022.
//

import UIKit

class DetailAlbumViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var album: Album?
    var songs = [Song]()
    
    private let albumLogoView: UIImageView = {
        let albumLogoView = UIImageView()
        albumLogoView.backgroundColor = .red
        albumLogoView.layer.cornerRadius = 10
        albumLogoView.clipsToBounds = true
        albumLogoView.translatesAutoresizingMaskIntoConstraints = false
        return albumLogoView
    }()
    
    private let albumNameLabel: UILabel = {
        let albumNameLabel = UILabel()
        albumNameLabel.numberOfLines = 0
        albumNameLabel.text = "Album Name"
        albumNameLabel.font = UIFont.systemFont(ofSize: 15)
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return albumNameLabel
    }()
    
    private let trackListLabel: UILabel = {
        let trackListLabel = UILabel()
        trackListLabel.numberOfLines = 0
        trackListLabel.text = "Track List"
        trackListLabel.font = UIFont.systemFont(ofSize: 20)
        trackListLabel.translatesAutoresizingMaskIntoConstraints = false
        return trackListLabel
    }()
    
    private let artistNameLabel: UILabel = {
        let artistNameLabel = UILabel()
        artistNameLabel.text = "Artist Name"
        artistNameLabel.font = UIFont.systemFont(ofSize: 15)
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return artistNameLabel
    }()
    
    private let releaseDateLabel: UILabel = {
        let releaseDateLabel = UILabel()
        releaseDateLabel.text = "Release date"
        releaseDateLabel.font = UIFont.systemFont(ofSize: 13)
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        return releaseDateLabel
    }()
    
    private let trackCountLabel: UILabel = {
        let trackCountLabel = UILabel()
        trackCountLabel.text = "10 tracks"
        trackCountLabel.font = UIFont.systemFont(ofSize: 13)
        trackCountLabel.translatesAutoresizingMaskIntoConstraints = false
        return trackCountLabel
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 13
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
        fetchAlbumInfo()
        fetchSongs()
        setImage(url: album?.artworkUrl100, imageView: albumLogoView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(albumLogoView)
        
        stackView = UIStackView(arrangedSubviews: [albumNameLabel,artistNameLabel,releaseDateLabel,trackCountLabel])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        view.addSubview(collectionView)
        view.addSubview(trackListLabel)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SongsCollectionViewCell
        let songName = songs[indexPath.row].trackName
        cell.songNameLabel.text = songName
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
            albumLogoView.heightAnchor.constraint(equalToConstant: 140),
            albumLogoView.widthAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: albumLogoView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            trackListLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            trackListLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            trackListLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            trackListLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 80),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}


//MARK: - Fetch Album Info
extension DetailAlbumViewController {
    private func fetchAlbumInfo() {
        guard let album = album else { return }
        self.albumNameLabel.text = "Album Name: \(album.collectionName)"
        self.trackCountLabel.text = "Track count: \(album.trackCount)"
        self.artistNameLabel.text = "Artist Name: \(album.artistName)"
        self.releaseDateLabel.text = "Release Date: \(setDateFormat(dateP: album.releaseDate))"
        
    }
    
    private func setDateFormat(dateP: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        guard let backEndDate = formatter.date(from: dateP) else { return "" }
        let formatDate = DateFormatter()
        formatDate.dateFormat = "dd-MM-yyyy"
        let date = formatDate.string(from: backEndDate)
        return date
    }
    
    private func setImage(url: String?, imageView: UIImageView) {
            if let urlString = url {
                NetworkManager.shared.request(urlString: urlString) { result in
                    switch result {
                        case .success(let data):
                            let image = UIImage(data: data)
                            imageView.image = image
                        case .failure(let error):
                            imageView.image = nil
                            print("No album logo" + error.localizedDescription)
                            
                    }
                }
            } else {
                imageView.image = nil
            }
        }
    
    private func fetchSongs() {
        guard let album = album else { return }
        let collectionIDAlbum = album.collectionId
        let urlString = "https://itunes.apple.com/lookup?id=\(String(describing: collectionIDAlbum))&entity=song"
        print(urlString)
        NetworkManager.shared.fetchSongs(urlString: urlString) { songModel, error in
            if error == nil {
                guard let songModel = songModel else { return }
                self.songs = songModel.results
                self.collectionView.reloadData()

            } else {
                self.alert(title: "Eror", message: error!.localizedDescription)
            }
    }
}
    
}

