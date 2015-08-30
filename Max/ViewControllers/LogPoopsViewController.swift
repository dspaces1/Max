//
//  LogPoopsViewController.swift
//  Max
//
//  Created by Diego Urquiza on 8/28/15.
//  Copyright © 2015 Diego Urquiza. All rights reserved.
//

import UIKit

class LogPoopsViewController: UIViewController {

    // MARK: Class Properties
    @IBOutlet weak var poopCountToday: UILabel!
    @IBOutlet weak var poopCountAllTime: UILabel!
    
    @IBOutlet weak var peeCountToday: UILabel!
    @IBOutlet weak var peeCountAllTime: UILabel!
    
    var potty: BabyPotty!
    
    
    
    // MARK: Class Methods
    @IBAction func incrementPoopCount(sender: AnyObject) {
        potty.addToStoolCount()
        updatePoopLabel()
    }
    
    @IBAction func incrementPeeCount(sender: AnyObject) {
        potty.addToPeeCount()
        updatePeeLabel()
    }
    
    func setUpViewsAndModel() {
        potty = BabyPotty()
        updateLabels()
    }
    
    func updateLabels () {
        updatePoopLabel()
        updatePeeLabel()
    }
    
    func updatePoopLabel(){
        poopCountToday.text = String(potty.myStools.numberOfPoopsToday)
        poopCountAllTime.text = String(potty.myStools.totalNumberOfPoops)
    }
    
    func updatePeeLabel() {
        peeCountToday.text = String(potty.myPee.numberOfPeeTimesToday)
        peeCountAllTime.text = String(potty.myPee.totalNumberOfPeeTimes)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViewsAndModel()
    }
}
