//
//  ReturningMainViewController.swift
//  NoteAppCoreData
//
//  Created by Ada on 8/7/21.
//

import UIKit
import Lottie


class ReturningMainViewController: UIViewController {

    @IBOutlet weak var journal: UIButton!
    
    @IBOutlet weak var resources: UIButton!
    
    @IBOutlet weak var settings: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieAnimation()
        
        journal.layer.cornerRadius = 25.0
        resources.layer.cornerRadius = 25.0
        settings.layer.cornerRadius = 25.0
        
        

        // Do any additional setup after loading the view.
    }
    func lottieAnimation(){
        let animationView = AnimationView(name: "wave-loader")
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .loop
        //bigger y, lower the image
        animationView.frame = CGRect(x: 87, y: 720, width: 240, height: 128)
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
