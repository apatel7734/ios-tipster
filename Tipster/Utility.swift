//
//  Utility.swift
//  Tipster
//
//  Created by Ashish Patel on 8/16/14.
//  Copyright (c) 2014 Average Techie. All rights reserved.
//

import UIKit

class Utility: NSObject {
    
    class func persistDefaultPercentages(first: Int,second: Int,third: Int) -> Bool{
        
        var defaults = NSUserDefaults.standardUserDefaults();
        defaults.setInteger(first, forKey: "first_percentage")
        defaults.setInteger(second, forKey: "second_percentage")
        defaults.setInteger(third, forKey: "third_percentage")
        defaults.synchronize()
        
        return false
    }
    
    
    class func loadDefaultPercentages() -> (firstVal : Int,secondVal :Int, thirdVal : Int){
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var first = defaults.integerForKey("first_percentage")
        var second = defaults.integerForKey("second_percentage")
        var third = defaults.integerForKey("third_percentage")
        return (first,second,third)
    }
    
    class func persistBillAmount(bilAmount: String){
        var defatuls = NSUserDefaults.standardUserDefaults()
        defatuls.setValue(bilAmount, forKey: "bill_amnt")
        var today = NSDate()
        defatuls.setValue(today, forKey: "last_ref_date")
        defatuls.synchronize()
    }
    
    class func loadBillAmount() -> (billAmnt:String,savedDate:NSTimeInterval){
        var defaults = NSUserDefaults.standardUserDefaults()
        let lastRefDate:AnyObject? = defaults.objectForKey("last_ref_date")
        if let date = lastRefDate as? NSDate{
            var timeInterval = date.timeIntervalSinceReferenceDate
            return (defaults.stringForKey("bill_amnt"),timeInterval)
        }
        return (defaults.stringForKey("bill_amnt"),-1)
    }
    
}
