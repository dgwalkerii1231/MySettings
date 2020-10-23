//
//  ViewController.swift
//  MySettings
//
//  Created by Danny Walker on 10/23/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!    
    @IBOutlet weak var txtPet: UITextField!
    @IBOutlet weak var txtCar: UITextField!
    @IBOutlet weak var txtFood: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    @IBAction func btnSave(_ sender: Any) {
        let defSettings: UserDefaults = UserDefaults.standard
        defSettings.set(self.txtName.text, forKey: "name")
        defSettings.set(self.txtPet.text, forKey: "pet")
        defSettings.set(self.txtCar.text, forKey: "car")
        defSettings.set(self.txtFood.text, forKey: "food")
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MMM d, yyyy"
        let newDate = dateFormat.string(from:date.date)
        defSettings.set(newDate, forKey: "birthdate")
        print(date.date.description)
        defSettings.synchronize()
        clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defSettings: UserDefaults = UserDefaults.standard
        if defSettings.string(forKey: "name") != nil
        {
            txtName.text = defSettings.string(forKey: "name")
        }
        if defSettings.string(forKey: "pet") != nil
        {
            txtPet.text = defSettings.string(forKey: "pet")
        }
        if defSettings.string(forKey: "car") != nil
        {
            txtCar.text = defSettings.string(forKey: "car")
        }
        if defSettings.string(forKey: "food") != nil
        {
            txtFood.text = defSettings.string(forKey: "food")
        }
        if defSettings.string(forKey: "birthdate") != nil
        {
            let newDate = defSettings.string(forKey: "birthdate")
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "MMM d, yyyy"
            let date2 = dateFormat.date(from: newDate!)
            date.setDate(date2!, animated: true)
        }
    }

    func clear()
    {
        txtName.resignFirstResponder()
        txtPet.resignFirstResponder()
        txtCar.resignFirstResponder()
        txtFood.resignFirstResponder()
    }
    
    
    
    
    

}

