//
//  SearchResult.swift
//  AppStoreJSONApis
//
//  Created by Mai Le Duong on 7/23/19.
//  Copyright © 2019 Mai Le Duong. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    var screenshotUrls: [String]?
    var artworkUrl100: String?
    var formattedPrice: String? //fix data canot comback
    var description: String?
    var releaseNotes: String?
    var artistName: String?
    var collectionName: String?
    
}

