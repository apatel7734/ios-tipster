//
//  ViewController.swift
//  Tipster
//
//  Created by Ashish Patel on 8/14/14.
//  Copyright (c) 2014 Average Techie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var percentageSC: UISegmentedControl!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text="$0.00"
        totalLabel.text = "$0.00"
        initializeDefaultPercIfNeeded()
        var billAmount=Utility.loadBillAmount().billAmnt
        var timeInterval = Utility.loadBillAmount().savedDate
        billTextField.text="\(billAmount)"
        println("bill amount = \(billAmount)")
        println("time interval = \(timeInterval)")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        initPercSegmentedControl()
        calculatePercentages()
    }
    
    func initializeDefaultPercIfNeeded(){
        var firstPerc = Utility.loadDefaultPercentages().firstVal
        var secondPerc = Utility.loadDefaultPercentages().secondVal
        var thirdPerc = Utility.loadDefaultPercentages().thirdVal
        
        if(firstPerc <= 0 || secondPerc <= 0 || thirdPerc <= 0){
            Utility.persistDefaultPercentages(18, second: 20, third: 22)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        println("viewWillDisappear")
        
        Utility.persistBillAmount(billTextField.text)
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        println("viewDidDisappear")
    }
    
    
    func initPercSegmentedControl(){
        var firstPerc = Utility.loadDefaultPercentages().firstVal
        percentageSC.setTitle("\(firstPerc)%", forSegmentAtIndex: 0)
        var secondPerc = Utility.loadDefaultPercentages().secondVal
        percentageSC.setTitle("\(secondPerc)%", forSegmentAtIndex: 1)
        var thirdPerc = Utility.loadDefaultPercentages().thirdVal
        percentageSC.setTitle("\(thirdPerc)%", forSegmentAtIndex: 2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBillAmountEditingChanged(sender: AnyObject) {
        calculatePercentages()
    }
    
    func calculatePercentages(){
        //load saved defaults
        var firstVal = Utility.loadDefaultPercentages().firstVal
        var secondVal = Utility.loadDefaultPercentages().secondVal
        var thirdVal = Utility.loadDefaultPercentages().thirdVal
        
        
        var tipPercentages = [Double(firstVal) / 100.0,Double(secondVal) / 100.0,Double(thirdVal) / 100.0]
        
        var tipPercentage = tipPercentages[percentageSC.selectedSegmentIndex]
        
        var billAmntStr = NSString(string: billTextField.text)
        var billAmount = billAmntStr.doubleValue
        
        var tipAmount = billAmount * tipPercentage;
        var total = billAmount + tipAmount
        
        tipLabel.text=String(format: "%.2f",tipAmount)
        totalLabel.text=String(format: "%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

