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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onPercentageValueChanged(sender: AnyObject) {
        var defaultPercentages=[18,20,22]
        
        var firstPercentageVal =  defaultPercentages[0] + Int(firstPercStepper.value)
        var secondPercentageVal = defaultPercentages[1] + Int(secondPercStepper.value)
        var thirdPercentageVal = defaultPercentages[2] + Int(thirdPercStepper.value)
        
        firstPercLabel.text = "\(firstPercentageVal)%"
        secondPercLabel.text = "\(secondPercentageVal)%"
        thirdPercLabel.text = "\(thirdPercentageVal)%"
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }

    
}
