//
//  AlbumsViewController.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 11.06.2022.
//

import UIKit

class AlbumsViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate {
    
    var albums = [Album]()
    var timer: Timer?
    private let searchController = UISearchController(searchResultsController: nil)
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(AlbumsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setViews()
        setTableViewConstraints()
        setSearchController()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        searchController.searchBar.delegate = self
    }
    
}

// MARK: Set SearchBar
extension AlbumsViewController {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        if text != "" {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
                self?.fetchAlbums(albumName: text!)
                self?.fetchAlbums(albumName: searchText)
            })
        } else {
            albums = []
            self.tableView.reloadData()
        }
    }
}

// MARK: Set setNavigationBar
extension AlbumsViewController {
    private func setNavigationBar() {
        navigationItem.title = "Albums"
        navigationItem.searchController = searchController
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: createUserInfoButton())
    }
    
    private func setSearchController() {
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func createUserInfoButton() -> UIButton {
        let userInfoButton = UIButton(type: .system)
        userInfoButton.setImage(UIImage(systemName: "person.fill"), for: .normal)
        userInfoButton.tintColor = .black
        userInfoButton.addTarget(self, action: #selector(userInfoButtonTapped), for: .touchUpInside)
        return userInfoButton
    }
    
    // MARK: - Search Albums
    private func fetchAlbums(albumName: String) {
        let urlString = "https://itunes.apple.com/search?term=\(albumName)&entity=album&attribute=albumTerm"
        NetworkManager.shared.fetchAlbums(urlString: urlString) { [weak self] albumModel, error in
            if error == nil {
                guard let albumModel = albumModel else { return }
                if albumModel.results != [] {
                    let sortedAlbums = albumModel.results.sorted { firstItem, secondItem in
                        return firstItem.collectionName.compare(secondItem.collectionName)
                        == ComparisonResult.orderedAscending
                    }
                    self?.albums = sortedAlbums
                    self?.tableView.reloadData()
                } else {
                    self?.alert(title: "Error", message: "Albums not founded")
                }
            } else {
                print(error!.localizedDescription)
            }
        }
    }
}

// MARK: - Set TableViewDelegate and TableViewDataSourse
extension AlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? AlbumsTableViewCell)
        else { return UITableViewCell() }
        let album = albums[indexPath.row]
        cell.configureCell(album: album)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailAlbumViewController = DetailAlbumViewController()
        let album = albums[indexPath.row]
        detailAlbumViewController.album = album
        detailAlbumViewController.title = album.artistName
        navigationController?.pushViewController(detailAlbumViewController, animated: true)
    }
}

// MARK: - Set Table View Constraints
extension AlbumsViewController {
    private func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

// MARK: - Set Views
extension AlbumsViewController {
    private func setViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
    }
}

// MARK: - Create UserInfoButton Action
extension AlbumsViewController {
    @objc private func userInfoButtonTapped() {
        let userInfoViewController = UserInfoViewController()
        navigationController?.pushViewController(userInfoViewController, animated: true)
        
    }
}
