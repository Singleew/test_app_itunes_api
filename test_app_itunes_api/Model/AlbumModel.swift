//
//  AlbumModel.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 12.06.2022.
//

import Foundation

struct AlbumModel: Codable, Equatable {
    let results: [Album]
}

struct Album: Codable, Equatable {
    let artistName: String
    let collectionName: String
    let artworkUrl100: String?
    let trackCount: Int
    let releaseDate: String
    let collectionId: Int
}
