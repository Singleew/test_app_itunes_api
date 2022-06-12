//
//  SongsModel.swift
//  test_app_itunes_api
//
//  Created by ilia nikashov on 12.06.2022.
//

import Foundation

struct SongsModel: Codable {
    let results: [Song]
}

struct Song: Codable {
    let trackName: String?
}
