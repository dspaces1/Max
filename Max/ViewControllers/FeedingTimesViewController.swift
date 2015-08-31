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

    
    @IBOutlet weak var feedingTableView: UITableView!
    @IBOutlet weak var lastTimeFeedLabel: UILabel!
    
    var feedingTimes:FeedingTimes!
    
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
    
    
    
    func updateFeedingTimeData() {
        feedingTimes = FeedingTimes()
        lastTimeFeedLabel.text = feedingTimes.getLastestFeedTime()
        feedingTableView.reloadData()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedingTableView.dataSource = self
        

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateFeedingTimeData()
    }
    

}

extension FeedingTimesViewController: UITableViewDataSource {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedingTimes.allFeedingTimes.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedingCells", forIndexPath: indexPath) as! FeedingTimeTableViewCell
        
        let reverse = feedingTimes.allFeedingTimes.sorted("timeCreated", ascending: false)
        let currentRow = reverse[indexPath.row]
        
        cell.typeOfFeedingTitleLabel.text = currentRow.typeOfFoodTitle
        cell.descriptionOfFeeding.text = currentRow.descriptionText
        cell.timeFeedLabel.text = FeedingTimeTableViewCell.timeFormatter.stringFromDate(currentRow.timeCreated)
        cell.dateFeedLabel.text = FeedingTimeTableViewCell.dateFormatter.stringFromDate(currentRow.timeCreated)

        
        
        return cell
    }
    
}


