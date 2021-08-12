//
//  FourFTVC.swift
//  NoteAppCoreData
//
//  Created by Ada on 8/12/21.
//

import UIKit

class FourFTVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(backToInitial(sender:)))
    }
    
    @objc func backToInitial(sender: AnyObject) {
        // Move to Home screen
        self.navigationController?.popToRootViewController(animated: true)
    }
    
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

