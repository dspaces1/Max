//
//  FormulaFeedingAmountViewController.swift
//  Max
//
//  Created by Diego Urquiza on 8/29/15.
//  Copyright © 2015 Diego Urquiza. All rights reserved.
//

import UIKit
import RealmSwift

class FormulaFeedingAmountViewController: UIViewController {

    @IBOutlet weak var amountOfFormulaLabel: UITextField!
    
    
    @IBAction func createNewCell(sender: AnyObject) {
        createFeedingCell()
    }
    
    
    func createFeedingCell() {
        
        if let formulaAmount = amountOfFormulaLabel.text.toInt(){
            
            writeToRealmWithNewCell(formulaOunces: formulaAmount)
            
        } else {
            displayMissingFieldAlert()
        }
        
    }
    
    func displayMissingFieldAlert() {
        let missingAlert = UIAlertController(title: "Missing Field", message: "Make sure all fields are filled in.", preferredStyle: UIAlertControllerStyle.Alert)
        missingAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(missingAlert, animated: true, completion: nil)
    }
    
    func writeToRealmWithNewCell(#formulaOunces: Int) {
        
        let newCell = BabyFood()
        let realm = Realm()
        
        newCell.typeOfFoodTitle = "Formula"
        newCell.descriptionText = "Ounces: \(formulaOunces)"
        newCell.timeCreated = NSDate()
        
        realm.beginWrite()
        realm.add(newCell)
        realm.commitWrite()
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
