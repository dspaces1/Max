//
//  BreastFeedingAmountViewController.swift
//  Max
//
//  Created by Diego Urquiza on 8/29/15.
//  Copyright © 2015 Diego Urquiza. All rights reserved.
//

import UIKit
import RealmSwift

class BreastFeedingAmountViewController: UIViewController {

    @IBOutlet weak var leftBoobTimeTextField: UITextField!
    @IBOutlet weak var rightBoobTimeTextField: UITextField!
    
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    
    @IBAction func submitFeedingTime(sender: AnyObject) {
        
        createFeedingCell()
        
    }
    
    func createFeedingCell() {
        
        if let leftBobTime = leftBoobTimeTextField.text.toInt(), rightBobTime = rightBoobTimeTextField.text.toInt() {
            
            writeToRealmWithNewCell(leftBobTime: leftBobTime, rightBobTime: rightBobTime)
            
        } else {
            displayMissingFieldAlert()
        }

    }
    
    
    func writeToRealmWithNewCell(#leftBobTime: Int, rightBobTime: Int) {
        
        let newCell = BabyFood()
        let realm = Realm()
        
        newCell.typeOfFoodTitle = "Breast Milk"
        newCell.descriptionText = "L: \(leftBobTime) minutes   R: \(rightBobTime) minutes"
        
        newCell.timeCreated = timePicker.date
        
        realm.beginWrite()
        realm.add(newCell)
        realm.commitWrite()
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    func displayMissingFieldAlert() {
        let missingAlert = UIAlertController(title: "Missing Field", message: "Make sure all fields are filled in.", preferredStyle: UIAlertControllerStyle.Alert)
        missingAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(missingAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
