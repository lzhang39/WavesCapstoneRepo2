//
//  FourFTVC.swift
//  NoteAppCoreData
//
//  Created by Ada on 8/12/21.
//

import UIKit
import Lottie
import AVFoundation

class FourFTVC: UIViewController {
    
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(backToInitial(sender:)))
        lottieAnimation()
        
        let pathToSound = Bundle.main.path(forResource: "Ocean-waves-crashing-sound", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToSound)

        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
    }
    }
    
    @objc func backToInitial(sender: AnyObject) {
        // Move to Home screen
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func lottieAnimation(){
        let loadingAnimation = Animation.named("lf30_editor_oosc6awj")
        let lottieView = AnimationView(animation: loadingAnimation)
        // 2. SECOND STEP (Adding and setup):
        self.view.addSubview(lottieView)
        lottieView.contentMode = .scaleAspectFit
        lottieView.loopMode = .autoReverse
        lottieView.play(toFrame: .infinity)
        lottieView.animationSpeed = 1
        // 3. THIRD STEP (LAYOUT PREFERENCES):
        lottieView.translatesAutoresizingMaskIntoConstraints = true
        NSLayoutConstraint.activate([
            lottieView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            lottieView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            lottieView.topAnchor.constraint(equalTo: self.view.topAnchor),
            lottieView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
