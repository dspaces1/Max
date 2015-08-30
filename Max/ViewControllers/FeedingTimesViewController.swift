//
//  FeedingTimesViewController.swift
//  Max
//
//  Created by Diego Urquiza on 8/29/15.
//  Copyright © 2015 Diego Urquiza. All rights reserved.
//

import UIKit
import RealmSwift


class FeedingTimesViewController: UIViewController {

    
    @IBOutlet weak var lastTimeFeedLabel: UILabel!
    
    @IBAction func addFeedingTime(sender: AnyObject) {
        
        displayAlertView()
    }
    
    
    func segueToBreastFeedingView(alert: UIAlertAction!) {
        performSegueWithIdentifier("addBreastFeedTime", sender: nil)
    }
    
    func segueToFormulaFeedingView(alert: UIAlertAction!) {
        performSegueWithIdentifier("addFormulaFeedTime", sender: nil)
    }
    
    func displayAlertView() {
       
        let alertView = UIAlertController(title: "Food", message: "How did Max eat?", preferredStyle: .Alert)
        let breastMilkSegue = UIAlertAction(title: "Breast Milk", style: UIAlertActionStyle.Default, handler: segueToBreastFeedingView)
        let formulaMilkSegue = UIAlertAction(title: "Formula Milk", style: UIAlertActionStyle.Default, handler: segueToFormulaFeedingView)
        alertView.addAction(breastMilkSegue); alertView.addAction(formulaMilkSegue)
        
        presentViewController(alertView, animated: true, completion: nil)
    }
    
    
    
    func viewSetUp() {
        
    }
    
    func getLastestFeedTime() -> String {
        var timeString: String = "0:00"
        
        let realm = Realm()
        let lastFeedTime = realm.objects(BabyFood)
        
        if lastFeedTime.count > 0 {
            
        } else {
            
        }
        
        return timeString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetUp()

    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addBreastFeedTime" {
            
            let addBreastFeedView: BreastFeedingAmountViewController = segue.destinationViewController as! BreastFeedingAmountViewController
            
            
            
        } else if segue.identifier == "addFormulaFeedTime" {
            
            let addFormulaFeedView: FormulaFeedingAmountViewController = segue.destinationViewController as! FormulaFeedingAmountViewController
            
            
        }


    }


}
