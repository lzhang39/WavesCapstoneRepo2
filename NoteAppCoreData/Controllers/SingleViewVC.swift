//
//  SingleViewVC.swift
//  NoteAppCoreData
//
//  Created by Lin Zhang on 8/10/21.
//

import UIKit
import CoreData

//var noteList = [Note]()



class SingleViewVC: UIViewController {
    
    @IBOutlet weak var Description1: UILabel!
    @IBOutlet weak var Title1: UILabel!
    @IBOutlet weak var Date1: UILabel!
    @IBOutlet weak var Wavelength: UILabel!
    
    @IBOutlet weak var moodCity1: UILabel!
    @IBOutlet weak var moodWeather1: UILabel!
    
    var selectedJournal : Note!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Title1.text = selectedJournal.title
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        Date1.text = formatter.string(from: selectedJournal.deletedDate!)

        Wavelength.text = selectedJournal.wavelength
        Description1.text = selectedJournal.desc
        
        
        moodCity1.text = selectedJournal.moodCity
        moodWeather1.text = selectedJournal.moodWeather
    
        
    }

}
