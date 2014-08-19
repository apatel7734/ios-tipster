//
//  SettingsViewController.swift
//  Tipster
//
//  Created by Ashish Patel on 8/16/14.
//  Copyright (c) 2014 Average Techie. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet var firstPercLabel: UILabel!
    @IBOutlet var secondPercLabel: UILabel!
    @IBOutlet var thirdPercLabel: UILabel!
    
    @IBOutlet var firstPercStepper: UIStepper!
    @IBOutlet var secondPercStepper: UIStepper!
    @IBOutlet var thirdPercStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var firstVal = Utility.loadDefaultPercentages().firstVal
        var secondVal = Utility.loadDefaultPercentages().secondVal
        var thirdVal = Utility.loadDefaultPercentages().thirdVal
        
        firstPercStepper.value=Double(firstVal)
        secondPercStepper.value=Double(secondVal)
        thirdPercStepper.value=Double(thirdVal)
        
        firstPercLabel.text = "\(firstVal)%"
        secondPercLabel.text = "\(secondVal)%"
        thirdPercLabel.text="\(thirdVal)%"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onPercentageValueChanged(sender: AnyObject) {
        
        firstPercLabel.text = "\(Int(firstPercStepper.value))%"
        secondPercLabel.text = "\(Int(secondPercStepper.value))%"
        thirdPercLabel.text = "\(Int(thirdPercStepper.value))%"
    }
    
    @IBAction func canceButtonClicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, nil)
    }
    
    
    @IBAction func saveButtonClicked(sender: AnyObject) {
        
        //get length of string
        var firstLen = firstPercLabel.text.utf16Count
        var secondLen = secondPercLabel.text.utf16Count
        var thirdLen = thirdPercLabel.text.utf16Count
        
        //substring of the string to remove percentage character
        var first = (firstPercLabel.text as NSString).substringToIndex(firstLen-1).toInt()
        var second = (secondPercLabel.text as NSString).substringToIndex(secondLen-1).toInt()
        var third = (thirdPercLabel.text as NSString).substringToIndex(thirdLen-1).toInt()
        
        Utility.persistDefaultPercentages(first!, second: second!, third: third!)
        dismissViewControllerAnimated(true, nil)
    }
    

    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    
}
