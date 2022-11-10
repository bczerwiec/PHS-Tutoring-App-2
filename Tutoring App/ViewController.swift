//
//  ViewController.swift
//  Tutoring App
//
//  Created by Bartosz Czerwiec on 9/2/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
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
    @IBOutlet weak var stuID: UITextField!
    @IBOutlet weak var tSpent: UITextField!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var locationTest: UILabel!
    
    var status: String = ""
    var fullName: String = ""
    var IDNumber: String = ""
    var year: String = ""
    var whatSubject: String = ""
    var whatHelp: String = ""
    var minHelped: Int = 0
    var totalTime: Int = 0
    var studentsHelped: Int = 0
    let locationManage = CLLocationManager()
    var longitude = 0.0
    var latitude = 0.0
    var sendAlert = false
    var exitTime = ""
    var minWorking = 0
    var IDArray:Array = [0]
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManage.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManage.delegate = self
            locationManage.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManage.startUpdatingLocation()
            IDArray.remove(at: 0)

        }
    }
    func boundary(personalLat: Double, personalLong: Double) -> Bool {
        let libraryLat = 42.079890
        let libraryLong = -87.949858
        let distance = sqrt(((personalLat-libraryLat)*(personalLat-libraryLat)) + ((personalLong-libraryLong))*(personalLong-libraryLong))
        let range = 0.00079452574
        print(distance)
        if distance > range {
            return false
        }
        else {
            return true
        }
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
            let message = UIAlertController(title: "Error", message: "Box Left Empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             })
            message.addAction(ok)
            self.present(message, animated: true, completion: nil)
        }
        else {
            if lastNameLabel.text == "" {
                let message = UIAlertController(title: "Error", message: "Box Left Empty", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                 })
                message.addAction(ok)
                self.present(message, animated: true, completion: nil)
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
                    firstNameLabel.resignFirstResponder()
                    lastNameLabel.resignFirstResponder()
                    idLabel.resignFirstResponder()
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
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            latitude = locValue.latitude
            longitude = locValue.longitude
                print("locations = \(locValue.latitude) \(locValue.longitude)")
            }
        if boundary(personalLat: latitude, personalLong: longitude) == false {
            sendAlert = true
            let today = Date()
            let hours   = (Calendar.current.component(.hour, from: today))
            let minutes = (Calendar.current.component(.minute, from: today))
            let seconds = (Calendar.current.component(.second, from: today))
            exitTime = "\(hours):\(minutes):\(seconds)"
            locationTest.text = "True"
            print(sendAlert, exitTime)
        }
        
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
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            latitude = locValue.latitude
            longitude = locValue.longitude
                print("locations = \(locValue.latitude) \(locValue.longitude)")
            }
        if boundary(personalLat: latitude, personalLong: longitude) == false {
            sendAlert = true
            let today = Date()
            let hours   = (Calendar.current.component(.hour, from: today))
            let minutes = (Calendar.current.component(.minute, from: today))
            let seconds = (Calendar.current.component(.second, from: today))
            exitTime = "\(hours):\(minutes):\(seconds)"
            locationTest.text = "True"
            print(sendAlert, exitTime)
        }
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
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            latitude = locValue.latitude
            longitude = locValue.longitude
                print("locations = \(locValue.latitude) \(locValue.longitude)")
            }
        if boundary(personalLat: latitude, personalLong: longitude) == false {
            sendAlert = true
            let today = Date()
            let hours   = (Calendar.current.component(.hour, from: today))
            let minutes = (Calendar.current.component(.minute, from: today))
            let seconds = (Calendar.current.component(.second, from: today))
            exitTime = "\(hours):\(minutes):\(seconds)"
            locationTest.text = "True"
            print(sendAlert, exitTime)
        }
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
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            latitude = locValue.latitude
            longitude = locValue.longitude
                print("locations = \(locValue.latitude) \(locValue.longitude)")
            }
        if boundary(personalLat: latitude, personalLong: longitude) == false {
            sendAlert = true
            let today = Date()
            let hours   = (Calendar.current.component(.hour, from: today))
            let minutes = (Calendar.current.component(.minute, from: today))
            let seconds = (Calendar.current.component(.second, from: today))
            exitTime = "\(hours):\(minutes):\(seconds)"
            locationTest.text = "True"
            print(sendAlert, exitTime)
        }
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
            subject.isHidden = true
            assignment.isHidden = true
            studying.isHidden = true
            stuID.isHidden = false
            tSpent.isHidden = false
            okButton.isHidden = false
            subject.resignFirstResponder()
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
            subject.isHidden = true
            assignment.isHidden = true
            studying.isHidden = true
            stuID.isHidden = false
            tSpent.isHidden = false
            okButton.isHidden = false
            subject.resignFirstResponder()
        }
    }
    
    @IBAction func ok(_ sender: UIButton) {
        if tSpent.text == "" {
            let dialogMessage = UIAlertController(title: "Error", message: "Time Spent Left Empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
        else if stuID.text == "" {
            let dialogMessage = UIAlertController(title: "Error", message: "ID# Left Empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
        else {
            let addID = Int(stuID.text!)!
            let stuTime = Int(tSpent.text!)!
            minHelped += stuTime
            IDArray.append(addID)
            helpLabel.isHidden = false
            freshman.isHidden = false
            sophmore.isHidden = false
            junior.isHidden = false
            senior.isHidden = false
            signOut.isHidden = false
            tSpent.isHidden = true
            stuID.isHidden = true
            cancel.isHidden = true
            okButton.isHidden = true
            stuID.text = ""
            tSpent.text = ""
            stuID.resignFirstResponder()
            tSpent.resignFirstResponder()
            studentsHelped += 1
            print(whatHelp,whatSubject,year,studentsHelped, minHelped, IDArray)
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
        okButton.isHidden = true
        stuID.isHidden = true
        tSpent.isHidden = true
        subject.text = ""
        stuID.text = ""
        tSpent.text = ""
        stuID.resignFirstResponder()
        tSpent.resignFirstResponder()
        subject.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

