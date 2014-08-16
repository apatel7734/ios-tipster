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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBillAmountEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18,0.2,0.22]
        var tipPercentage = tipPercentages[        percentageSC.selectedSegmentIndex]
        var billAmntStr = NSString(string: billTextField.text);
        var billAmount = billAmntStr.doubleValue;
        var tipAmount = billAmount * tipPercentage;
        var total = billAmount + tipAmount
        tipLabel.text=String(format: "%.2f",tipAmount)
        totalLabel.text=String(format: "%.2f", total)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

