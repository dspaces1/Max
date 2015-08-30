//
//  BabyFoodModel.swift
//  Max
//
//  Created by Diego Urquiza on 8/29/15.
//  Copyright © 2015 Diego Urquiza. All rights reserved.
//

import Foundation
import RealmSwift

class BreastMilk: Object {
 
    dynamic var timeFeed: NSDate = NSDate()
    dynamic var leftBreastFeedTimeLength: Int = 0
    dynamic var rightBreastFeedTimeLength: Int = 0
    
}


class FormulaMilk: Object {
    
    dynamic var timeFeed: NSDate = NSDate()
    dynamic var ouncesFeed: Int = 0
}

class BabyFood: Object {
    
    dynamic var typeOfFoodTitle: String = ""
    dynamic var descriptionText: String = ""
    dynamic var timeCreated: NSDate = NSDate()

}

