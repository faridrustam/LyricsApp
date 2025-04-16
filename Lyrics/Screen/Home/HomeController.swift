//
//  ViewController.swift
//  Lyrics
//
//  Created by Farid Rustamov on 13.04.25.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet private weak var artistTextField: UITextField!
    @IBOutlet private weak var musicTextField: UITextField!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()
    }
    
    private func configureUI() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func configureViewModel() {
        viewModel.success = { [weak self] in
            self?.navigateToLyricsController()
        }
        
        viewModel.failure = { errorMessage in
            print("Error: \(errorMessage)")
        }
    }
    
    private func getData() {
        guard let artist = artistTextField.text, !artist.isEmpty,
                  let song = musicTextField.text, !song.isEmpty else {
                print("Artist or Song name is empty.")
                return
            }
        Task {
            await viewModel.getLyrics(artist: artistTextField.text ?? "", song: musicTextField.text ?? "")
        }
    }
    
    private func navigateToLyricsController() {
            guard let lyrics = viewModel.lyrics?.lyrics else {
                print("Lyrics are nil")
                return
            }
            
            let controller = storyboard?.instantiateViewController(identifier: "\(LyricsController.self)") as! LyricsController
            controller.songLyrics = lyrics
            navigationController?.show(controller, sender: nil)
        }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        getData()
    }
}

