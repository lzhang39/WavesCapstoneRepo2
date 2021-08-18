//
//  SingleViewVC.swift
//  NoteAppCoreData
//
//  Created by Lin Zhang on 8/10/21.
//

import UIKit
import CoreData
import Lottie

//var noteList = [Note]()



class SingleViewVC: UIViewController {
    
    @IBOutlet weak var Description1: UILabel!
    @IBOutlet weak var Title1: UILabel!
    @IBOutlet weak var Date1: UILabel!
    @IBOutlet weak var Wavelength: UILabel!
    
    var selectedJournal : Note!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieAnimation()
        Title1.text = selectedJournal.title
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        Date1.text = formatter.string(from: selectedJournal.deletedDate!)

        Wavelength.text = selectedJournal.wavelength
        Description1.text = selectedJournal.desc
        
        
        
    }
    
    
    func lottieAnimation(){
        let animationView = AnimationView(name: "69971-sea-view")
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .loop
        //bigger y, lower the image
        animationView.frame = CGRect(x: 0, y: 46, width: 414, height: 220)
        //animationView.center = view.topAnchor
        
    }

}
