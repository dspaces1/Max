//
//  FeedingTimesViewController.swift
//  Max
//
//  Created by Diego Urquiza on 8/29/15.
//  Copyright © 2015 Diego Urquiza. All rights reserved.
//

import UIKit

class FeedingTimesViewController: UIViewController {

    @IBAction func addFeedingTime(sender: AnyObject) {
        performSegueWithIdentifier("addBreastFeedTime", sender: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
