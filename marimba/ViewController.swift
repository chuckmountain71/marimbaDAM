//
//  ViewController.swift
//  marimba
//
//  Created by Carlos on 15/04/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var reproductor: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func teclaSeleccionadaBTN(_ sender: UIButton) {
        
        print(sender.titleLabel?.text ?? "1")
        
        reproducirNota(cualNota: sender.titleLabel?.text ?? "1")
        
    }
    
    func reproducirNota(cualNota: String){
        guard let url = Bundle.main.url(forResource: cualNota, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            
            try AVAudioSession.sharedInstance().setActive(true)
            
            reproductor = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            reproductor?.play()
            
        } catch let error {
            
            print(error.localizedDescription)
            
        }
        
    }
    
    
}

