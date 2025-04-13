//
//  LyricsCell.swift
//  Lyrics
//
//  Created by Farid Rustamov on 13.04.25.
//

import UIKit

class LyricsCell: UITableViewCell {

    @IBOutlet private weak var lyricsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with lyrics: String) {
        lyricsLabel.text = lyrics
    }
}
