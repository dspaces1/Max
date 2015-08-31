//
//  FeedingTimeTableViewCell.swift
//  
//
//  Created by Diego Urquiza on 8/30/15.
//
//

import UIKit

class FeedingTimeTableViewCell: UITableViewCell {

    @IBOutlet weak var typeOfFeedingTitleLabel: UILabel!

    @IBOutlet weak var descriptionOfFeeding: UILabel!
    
    @IBOutlet weak var timeFeedLabel: UILabel!
    
    @IBOutlet weak var dateFeedLabel: UILabel!
    
    
    
    static var dateFormatter: NSDateFormatter = {
        var formatter = NSDateFormatter()
        formatter.dateStyle = .ShortStyle
        return formatter
    }()
    
    static var timeFormatter: NSDateFormatter = {
        var formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        return formatter
    }()

}
