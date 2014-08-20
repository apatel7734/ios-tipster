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
            defatuls.setValue(today.timeIntervalSince1970, forKey: "time_interval")
            defatuls.synchronize()
        }
        
        class func loadBillAmount() -> (billAmnt:String){
            var defaults = NSUserDefaults.standardUserDefaults()
            return defaults.stringForKey("bill_amnt")
        }
        
        
        class func loadLastRefTimeInterval() -> (savedDate:Int){
            var defaults = NSUserDefaults.standardUserDefaults()
            var timeInterval = defaults.integerForKey("time_interval")
            return timeInterval
        }
        
    }
