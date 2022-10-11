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
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var freshman: UIButton!
    @IBOutlet weak var sophmore: UIButton!
    @IBOutlet weak var junior: UIButton!
    @IBOutlet weak var senior: UIButton!
    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var assignment: UIButton!
    @IBOutlet weak var studying: UIButton!
    @IBOutlet weak var signOut: UIButton!
    @IBOutlet weak var cancel: UIButton!
    
    var status: String = ""
    var fullName: String = ""
    var IDNumber: String = ""
    var year: String = ""
    var whatSubject: String = ""
    var whatHelp: String = ""
    var studentsHelped: Int = 0
    
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
                    status = "Signed In"
                    firstNameLabel.isHidden = true
                    lastNameLabel.isHidden = true
                    idLabel.isHidden = true
                    enterButton.isHidden = true
                    helpLabel.isHidden = false
                    freshman.isHidden = false
                    sophmore.isHidden = false
                    junior.isHidden = false
                    senior.isHidden = false
                    signOut.isHidden = false
                }
            }
        }
 
        print(fullName)
        print(IDNumber)
        print(firstNameLabel.isHidden, lastNameLabel.isHidden, idLabel.isHidden)
    }
    
    @IBAction func freshmanButton(_ sender: UIButton) {
        subject.isHidden = false
        assignment.isHidden = false
        studying.isHidden = false
        cancel.isHidden = false
        helpLabel.isHidden = true
        freshman.isHidden = true
        sophmore.isHidden = true
        junior.isHidden = true
        senior.isHidden = true
        signOut.isHidden = true
        year = "Freshman"
    }
    
    @IBAction func sophmoreButton(_ sender: UIButton) {
        subject.isHidden = false
        assignment.isHidden = false
        studying.isHidden = false
        cancel.isHidden = false
        helpLabel.isHidden = true
        freshman.isHidden = true
        sophmore.isHidden = true
        junior.isHidden = true
        senior.isHidden = true
        signOut.isHidden = true
        year = "Sophmore"
    }
    
    @IBAction func juniorButton(_ sender: UIButton) {
        subject.isHidden = false
        assignment.isHidden = false
        studying.isHidden = false
        cancel.isHidden = false
        helpLabel.isHidden = true
        freshman.isHidden = true
        sophmore.isHidden = true
        junior.isHidden = true
        senior.isHidden = true
        signOut.isHidden = true
        year = "Junior"
    }
 
    @IBAction func seniorButton(_ sender: UIButton) {
        subject.isHidden = false
        assignment.isHidden = false
        studying.isHidden = false
        cancel.isHidden = false
        helpLabel.isHidden = true
        freshman.isHidden = true
        sophmore.isHidden = true
        junior.isHidden = true
        senior.isHidden = true
        signOut.isHidden = true
        year = "Senior"
    }
    
    @IBAction func assignmentButton(_ sender: UIButton) {
        if subject.text == "" {
            let dialogMessage = UIAlertController(title: "Error", message: "Subject Left Empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
        else {
            whatSubject = "\(subject.text!)"
            whatHelp = "Assignment"
            subject.text = ""
            helpLabel.isHidden = false
            freshman.isHidden = false
            sophmore.isHidden = false
            junior.isHidden = false
            senior.isHidden = false
            signOut.isHidden = false
            subject.isHidden = true
            assignment.isHidden = true
            studying.isHidden = true
            cancel.isHidden = true
            studentsHelped += 1
            print(whatHelp,whatSubject,year,studentsHelped)
        }
    }
    
    @IBAction func studyingButton(_ sender: UIButton) {
        if subject.text == "" {
            let dialogMessage = UIAlertController(title: "Error", message: "Subject Left Empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
        else {
            whatSubject = "\(subject.text!)"
            whatHelp = "Studying"
            subject.text = ""
            helpLabel.isHidden = false
            freshman.isHidden = false
            sophmore.isHidden = false
            junior.isHidden = false
            senior.isHidden = false
            signOut.isHidden = false
            subject.isHidden = true
            assignment.isHidden = true
            studying.isHidden = true
            cancel.isHidden = true
            studentsHelped += 1
            print(whatHelp,whatSubject,year,studentsHelped)
        }
    }
    @IBAction func signOutButton(_ sender: UIButton) {
        helpLabel.isHidden = true
        freshman.isHidden = true
        sophmore.isHidden = true
        junior.isHidden = true
        senior.isHidden = true
        signOut.isHidden = true
        signInButton.isHidden = false
        status = "Signed Out"
    }
    @IBAction func cancelButton(_ sender: UIButton) {
        helpLabel.isHidden = false
        freshman.isHidden = false
        sophmore.isHidden = false
        junior.isHidden = false
        senior.isHidden = false
        signOut.isHidden = false
        subject.isHidden = true
        assignment.isHidden = true
        studying.isHidden = true
        cancel.isHidden = true
    }
}

