//
//  ZeroFTVC.swift
//  NoteAppCoreData
//
//  Created by Lin Zhang on 8/12/21.
//
    
    
    
import UIKit
import Lottie
import AVFoundation


class ZeroFTVC: UIViewController {
    
    @IBOutlet var button: UIButton!
    
    //VAR PLAYER:
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Added navigation button
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(backToInitial(sender:)))
//        lottieAnimation()
    }
    
    
    @IBAction func didTapButton(_ sender: Any) {
        let pathToSound = Bundle.main.path(forResource: "seagull-beach-sound-effect", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToSound)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
        // error handling
    }
}
    
    
    @objc func backToInitial(sender: AnyObject) {
        // Move to Home screen
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func lottieAnimation(){
        // 1. FIRST STEP (Decoding and Initializing):
        let loadingAnimation = Animation.named("over-the-sea")
        let lottieView = AnimationView(animation: loadingAnimation)
        // 2. SECOND STEP (Adding and setup):
        self.view.addSubview(lottieView)
        lottieView.contentMode = .scaleToFill
        lottieView.loopMode = .loop
        lottieView.play(toFrame: .infinity)
        // 3. THIRD STEP (LAYOUT PREFERENCES):
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lottieView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            lottieView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            lottieView.topAnchor.constraint(equalTo: self.view.topAnchor),
            lottieView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

}


//@IBAction func itemTapped(_ sender: UIButton){
////        let selectedItem = sender.tag
//    let pathToSound = Bundle.main.path(forResource: "seagull-beach-sound-effect", ofType: "mp3")!
//    let url = URL(fileURLWithPath: pathToSound)
////        if let player = audioPlayer, player.isPlaying{
////            // stop playback
////            button.setTitle("Stop", for: .normal)
////            player.stop()
////        }
////        else{
////            // set up player, and play
////            button.setTitle("Play", for: .normal)
////
////            do{
////                audioPlayer = try AVAudioPlayer(contentsOf: url)
////                audioPlayer?.play()
////            }
////            catch{
////        }
//    do{
//        audioPlayer = try AVAudioPlayer(contentsOf: url)
//        audioPlayer?.play()
//    } catch {
////         error handling
//}
//}

