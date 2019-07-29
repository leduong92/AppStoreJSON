//
//  AppGroup.swift
//  AppStoreJSONApis
//
//  Created by Mai Le Duong on 7/25/19.
//  Copyright © 2019 Mai Le Duong. All rights reserved.
//

import UIKit

struct AppGroup: Decodable {
    let feed: Feed
}


struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
