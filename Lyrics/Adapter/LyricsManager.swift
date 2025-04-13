//
//  LyricsManager.swift
//  Lyrics
//
//  Created by Farid Rustamov on 13.04.25.
//

import Foundation

protocol LyricsManagerUseCase {
    func getLyrics(artist: String, song: String) async throws -> Lyrics?
}

class LyricsManager: LyricsManagerUseCase {
    
    let manager = NetworkManager()
    
    func getLyrics(artist: String, song: String) async throws -> Lyrics? {
        let path = NetworkHelper.shared.configureUrl(artist: artist, song: song)
        
        return try await manager.request(path: path, model: Lyrics.self)
    }
}
