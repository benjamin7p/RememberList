//
//  DetailViewController.swift
//  RememberList
//
//  Created by Benjamin Poulsen PRO on 1/7/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    var rememberNoteManager: RememberNoteManager?
    
    
    var delegate: RememberNoteDelegate?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        if let text = nameTextField.text {
            delegate?.saveText(text: text)
            
        }
        
        //RememberNoteDelegate.save()
        
        // go back
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
protocol RememberNoteDelegate {
    func saveText(text: String)
    
    
}
