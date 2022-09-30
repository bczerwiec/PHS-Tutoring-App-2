//
//  ViewController.swift
//  Tutoring App
//
//  Created by Bartosz Czerwiec on 9/2/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tutoringLabel: UILabel!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var idLabel: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    var fullName: String = ""
    var IDNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signIn(_ sender: UIButton) {
        signInButton.isHidden = true
        firstNameLabel.isHidden = false
        lastNameLabel.isHidden = false
        idLabel.isHidden = false
        enterButton.isHidden = false
        
        
    }
    @IBAction func enter(_ sender: UIButton) {
        if firstNameLabel.text == "" {
            let dialogMessage = UIAlertController(title: "Error", message: "Box Left Empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
        else {
            if lastNameLabel.text == "" {
                let dialogMessage = UIAlertController(title: "Error", message: "Box Left Empty", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                 })
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
            }
            else {
                if idLabel.text == "" {
                    let dialogMessage = UIAlertController(title: "Error", message: "Box Left Empty", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                     })
                    dialogMessage.addAction(ok)
                    self.present(dialogMessage, animated: true, completion: nil)
                }
                else {
                    fullName = "\(firstNameLabel.text!) \(lastNameLabel.text!)"
                    IDNumber = idLabel.text!
                    firstNameLabel.isHidden = true
                    lastNameLabel.isHidden = true
                    idLabel.isHidden = true
                    enterButton.isHidden = true
                }
            }
        }
 
        print(fullName)
        print(IDNumber)
        print(firstNameLabel.isHidden, lastNameLabel.isHidden, idLabel.isHidden)
    }
    
    
}

