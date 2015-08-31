//
//  BabyFoodModel.swift
//  Max
//
//  Created by Diego Urquiza on 8/29/15.
//  Copyright © 2015 Diego Urquiza. All rights reserved.
//

import Foundation
import RealmSwift

//class BreastMilk: Object {
// 
//    dynamic var timeFeed: NSDate = NSDate()
//    dynamic var leftBreastFeedTimeLength: Int = 0
//    dynamic var rightBreastFeedTimeLength: Int = 0
//    
//}
//
//
//class FormulaMilk: Object {
//    
//    dynamic var timeFeed: NSDate = NSDate()
//    dynamic var ouncesFeed: Int = 0
//}


class BabyFood: Object {
    
    dynamic var typeOfFoodTitle: String = ""
    dynamic var descriptionText: String = ""
    dynamic var timeCreated: NSDate = NSDate()

}

class FeedingTimes {
    
    let realm = Realm()
    var allFeedingTimes:Results<BabyFood>!
    
    init() {
        allFeedingTimes = getAllFeedingTimes()
    }
    
    func getLastestFeedTime() -> String {
        var timeString: String = "0:00"
        
        if allFeedingTimes.count > 0 {
            let feedTimeInOrder = allFeedingTimes.sorted("timeCreated", ascending: false)
            
            timeString = FeedingTimeTableViewCell.timeFormatter.stringFromDate(feedTimeInOrder[0].timeCreated)
        }
        
        return timeString
    }
    
    func getAllFeedingTimes() -> Results<BabyFood> {
        
        let allFeedTimes: Results<BabyFood> = realm.objects(BabyFood)
        return allFeedTimes
    }
    
}