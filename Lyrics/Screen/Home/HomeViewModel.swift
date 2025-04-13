//
//  HomeViewModel.swift
//  Lyrics
//
//  Created by Farid Rustamov on 13.04.25.
//

import Foundation

class HomeViewModel {
    let manager = LyricsManager()
    var lyrics: Lyrics?
    var success: (() -> Void)?
    var failure: ((String) -> Void)?
    
    func getLyrics(artist: String, song: String) async {
        do {
            let items = try await manager.getLyrics(artist: artist, song: song)
            self.lyrics = items
            Task { @MainActor in
                self.success?()
            }
        } catch {
            Task { @MainActor in
                self.failure?(error.localizedDescription)
            }
        }
    }
}
