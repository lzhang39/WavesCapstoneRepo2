//
//  WaveExplanationViewController.swift
//  NoteAppCoreData
//
//  Created by Ada on 8/7/21.
//

import UIKit
import Lottie

class WaveExplanationViewController: UIViewController {
    @IBOutlet weak var QuoteButton: UIButton!
    
    @IBOutlet weak var LinkButton: UIButton!
    //    @IBOutlet weak var LinkButton: UIButton!
    
    @IBAction func LinkButton(_ sender: Any) {
        if let url = URL(string: "https://www.thedinnerparty.org/") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
         }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuoteButton.layer.cornerRadius = 25.0
        LinkButton.layer.cornerRadius = 25.0
        lottieAnimation()

        // Do any additional setup after loading the view.
        
    }
    func lottieAnimation(){
        let animationView = AnimationView(name: "21319-particle-wave-with-depth (1)")
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .loop
        //bigger y, lower the image
        animationView.frame = CGRect(x: 50, y: 640, width: 300, height: 128)
//        animationView.center = view.center
        
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
