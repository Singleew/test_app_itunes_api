//
//  AlbumsViewController.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 11.06.2022.
//

import UIKit

class AlbumsViewController: UIViewController, UISearchControllerDelegate {
    
    
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
        setDelegate()
    }
    
}

//MARK: Set Navigation Bar (userInfoButton and SearchBar)
extension AlbumsViewController: UISearchBarDelegate {
    
    private func setNavigationBar() {
        navigationItem.title = "Albums"
        navigationItem.searchController = createSearchController()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: createUserInfoButton())
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    private func createSearchController() -> UISearchController {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }
    
    private func createUserInfoButton() -> UIButton {
        let userInfoButton = UIButton(type: .system)
        userInfoButton.setImage(UIImage(systemName: "person.fill"), for: .normal)
        userInfoButton.tintColor = .black
        userInfoButton.addTarget(self, action: #selector(userInfoButtonTapped), for: .touchUpInside)
        return userInfoButton
    }
}

//MARK: - Set TableViewDelegate and TableViewDataSourse
extension AlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AlbumsTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailAlbumViewController = DetailAlbumViewController()
        navigationController?.pushViewController(detailAlbumViewController, animated: true)
    }
    
}

//MARK: - Set Table View Constraints
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

//MARK: - Set Views
extension AlbumsViewController {
    private func setViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        setTableViewConstraints()
    }
}

//MARK: - Set Delegate
extension AlbumsViewController {
    private func setDelegate() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationItem.searchController?.delegate = self
    }
}

//MARK: - Create UserInfoButton Action
extension AlbumsViewController {
    @objc private func userInfoButtonTapped() {
        let userInfoViewController = UserInfoViewController()
        navigationController?.pushViewController(userInfoViewController, animated: true)
        
    }
}



