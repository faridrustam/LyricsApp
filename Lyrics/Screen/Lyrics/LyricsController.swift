//
//  LyricsController.swift
//  Lyrics
//
//  Created by Farid Rustamov on 13.04.25.
//

import UIKit

class LyricsController: UIViewController {

    @IBOutlet private weak var table: UITableView!
    
    var songLyrics: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "LyricsCell", bundle: nil), forCellReuseIdentifier: "LyricsCell")
    }
}

extension LyricsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LyricsCell", for: indexPath) as! LyricsCell
        cell.configure(with: songLyrics)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
