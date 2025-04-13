//
//  NetworkHelper.swift
//  Lyrics
//
//  Created by Farid Rustamov on 13.04.25.
//

import Foundation

enum EncodingType {
    case json
    case url
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private init() {}
    
    let baseUrl = "https://api.lyrics.ovh/v1"
    
    func configureUrl(artist: String, song: String) -> String {
        return baseUrl + "/" + "\(artist)" + "/" + "\(song)"
    }
}
