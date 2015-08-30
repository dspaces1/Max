//
//  BabyPoopModel.swift
//  Max
//
//  Created by Diego Urquiza on 8/28/15.
//  Copyright © 2015 Diego Urquiza. All rights reserved.
//

import Foundation
import RealmSwift


class Stool: Object {
    
    dynamic var id = 0
    
    let title: String = "Stool"
    dynamic var numberOfPoopsToday: Int = 0
    dynamic var totalNumberOfPoops: Int = 0

    override static func primaryKey() -> String? {
        return "id"
    }
}

class Pee: Object {
    
    dynamic var id = 0
    
    let title: String = "Pee"
    dynamic var numberOfPeeTimesToday: Int = 0
    dynamic var totalNumberOfPeeTimes: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class CurrentDate: Object {
    dynamic var id = 0
    dynamic var lastDayUpdated: NSDate = NSDate()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

class BabyPotty {
  
    let realm = Realm()
    
    var myStools: Stool = Stool()
    var myPee: Pee = Pee()
    var currentDate: CurrentDate = CurrentDate()

    init() {
        getLocalDataForPotty()
        resetCounterIfNewDay()
    }
    
    func getLocalDataForPotty() {
        getStoolData()
        getPeeData()
    }
    
    func getStoolData() {
        
        let stoolData = realm.objects(Stool).filter("id = 0")
        
        if stoolData.count > 0 {
            myStools = stoolData[0]
        } else {
            realm.write { realm.create(Stool.self, value: ["id": 0, "numberOfPoopsToday": 0, "totalNumberOfPoops": 0], update: true ) }
        }
    }
    
    func getPeeData() {
        
        let peeData = realm.objects(Pee).filter("id = 0")
        
        if peeData.count > 0 {
            myPee = peeData[0]
        } else {
            realm.write { realm.create(Pee.self, value: ["id": 0, "numberOfPeeTimesToday": 0, "totalNumberOfPeeTimes": 0], update: true ) }
        }
    }
    
    func addToStoolCount() {
        
        realm.beginWrite()
        myStools.numberOfPoopsToday++
        myStools.totalNumberOfPoops++
        realm.commitWrite()
    }
    
    func addToPeeCount() {
        
        realm.beginWrite()
        myPee.numberOfPeeTimesToday++
        myPee.totalNumberOfPeeTimes++
        realm.commitWrite()
    }
    
    func resetCounterIfNewDay() {
        
        getCurrentTime()
        
        if checkForNewDay(currentDate.lastDayUpdated) {
            resetPoopAndPeeCounters()
        }
    }
    
    func getCurrentTime(){
        
        let time = realm.objects(CurrentDate).filter("id = 0")
        
        if time.count > 0 {
            currentDate = time[0]
        } else {
            realm.write { realm.create(CurrentDate.self, value: ["id": 0, "lastDayUpdated": NSDate()], update: true ) }
        }
        
    }
    
    func resetPoopAndPeeCounters() {
        realm.beginWrite()
        myPee.numberOfPeeTimesToday = 0
        myStools.numberOfPoopsToday = 0
        realm.commitWrite()
    }
    
    func checkForNewDay(date: NSDate) -> Bool {
        
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        var isNewDay: Bool = true
        
        if calendar.isDateInToday(date) {
            isNewDay = false
        }
        
        return isNewDay
    }
    
}