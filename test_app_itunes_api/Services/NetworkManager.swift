//
//  NetworkManager.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 12.06.2022.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    func request(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {

        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                completion(.success(data))
            }
        }.resume()
    }

    func fetchAlbums(urlString: String, response: @escaping (AlbumModel?, Error?) -> Void) {
        request(urlString: urlString) { result in
            switch result {
            case .success(let data): do {
                    let albums = try JSONDecoder().decode(AlbumModel.self, from: data)
                    response(albums, nil)
                } catch let jsonError {
                    print("Failed decode JSON", jsonError)

                }

            case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    response(nil, error)
            }
        }
    }

    func fetchSongs(urlString: String, response: @escaping (SongsModel?, Error?) -> Void) {
        request(urlString: urlString) { result in
            switch result {
            case .success(let data): do {
                    let song = try JSONDecoder().decode(SongsModel.self, from: data)
                    response(song, nil)
                } catch let jsonError {
                    print("Failed decode JSON", jsonError)

                }

            case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    response(nil, error)
            }
        }
    }

}
